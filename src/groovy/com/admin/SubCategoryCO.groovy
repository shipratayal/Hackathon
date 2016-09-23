package com.admin

import com.Category
import com.SubCategory
import grails.validation.Validateable

@Validateable
class SubCategoryCO {


    String name
    Category category

    static constraints = {
        name(nullable: false,blank: false)
        category(nullable: false)
    }

    SubCategory populateDataFromSubCategoryCO(){
        SubCategory subCategory=new SubCategory()
        subCategory.name=this?.name
        subCategory.category=this?.category
        return subCategory
    }
    def populateDataFromParams(def params){
        def categoryId=params.category as Long
        Category category1=Category.findById(categoryId)
        this.name=params.name
        this.category=category1
    }
}
