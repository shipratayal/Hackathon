package com.book

import com.Author
import com.Book
import com.Category
import com.Store
import com.SubCategory
import com.admin.BookCO
import com.admin.CategoryCO
import com.admin.SubCategoryCO
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class CategoryController {
    def adminService

    def allCategory(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        List<Category> categoryList = Category.createCriteria().list(max: params.max, offset: params.offset) {

        }
        render(view: "allCategory", model: [categoryList: categoryList, categoryTotal: categoryList.totalCount, max: params.max])
    }

    def addCategory() {
        CategoryCO categoryCO = new CategoryCO()
        Category category = new Category()
        render(view: "addCategory", model: [categoryCO: categoryCO, category: category])
    }

    def saveCategory() {
        println("Save Category")
        CategoryCO categoryCO = new CategoryCO()
        categoryCO.populateDataFromParams(params)
        if (!categoryCO.validate()) {
            render(view: 'addCategory', model: [categoryCO: categoryCO])
            return
        }
        Category category = categoryCO.populateDataFromCategoryCO()
        def subCategories = SubCategory.getAll(params.list('subcategory'))
        category.subCategories = subCategories
        category.save(flush: true)
        println("//////${category.subCategories}//////////")
        redirect(controller: 'category', action: 'allCategory')
    }

    def showCategory(Long id) {
        Category category = Category.findById(id)
        def subCategories = SubCategory.list()
        def categorySub = category.subCategories
        def subList = []
        subCategories.each { subCategory ->
            if (!(subCategory in categorySub)) {
                subList << subCategory
            }
        }
        render(view: 'showCategory', model: [category: category, subList: subList])
    }

    def deleteCategory() {
        def data=[:]
        def id = params.id as Long
        println("My Category is "+id)
        def category = Category.findById(id)
        Boolean flag=adminService.deleteCategory(category)
        if(flag){
            data.success="success"
        }
        else {
            println("Failed")
            data.failed="failed"
        }
        render data as JSON
    }

    def updateCategory() {

    }

    def allSubCategory(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        List<SubCategory> subCategoryList = SubCategory.createCriteria().list(max: params.max, offset: params.offset) {

        }
        render(view: "allSubCategory", model: [subCategoryList: subCategoryList, subCategoryTotal: subCategoryList.totalCount, max: params.max])
    }

    def addSubCategory() {
        SubCategoryCO subCategoryCO = new SubCategoryCO()
        render(view: "addSubCategory", model: [subCategoryCO: subCategoryCO])
    }

    def saveSubCategory() {
        println("Save Sub Category")
        SubCategoryCO subCategoryCO = new SubCategoryCO()
        subCategoryCO.populateDataFromParams(params)
        if (!subCategoryCO.validate()) {
            render(view: "addSubCategory", model: [subCategoryCO: subCategoryCO])
            return
        }
        SubCategory subCategory = subCategoryCO.populateDataFromSubCategoryCO()
        def books = Book.getAll(params.list('books'))
        subCategory.books = books
        subCategory.save(flush: true)
        redirect(controller: 'category', action: 'allCategory')
    }

    def updateSubCategory() {

    }

    def deleteSubCategory() {
        println("/////")
        def data=[:]
        def id = params.id as Long
        println("My SubCategory is "+id)
        def subCategory = SubCategory.findById(id)
        Boolean flag=adminService.deleteSubCategory(subCategory)
        if(flag){
            data.success="success"
        }
        else {
            println("Failed")
            data.failed="failed"
        }
        render data as JSON
    }

    def showSubCategory(Long id) {
        SubCategory subCategory = SubCategory.findById(id)
        def bookAuthors = subCategory.books
        def books = Book.list()
        def bookList = []
        books.each { book ->
            if (!(book in bookAuthors))
                bookList << book
        }

        render(view: 'showSubCategory', model: [subCategory: subCategory, bookList: bookList])
    }

}
