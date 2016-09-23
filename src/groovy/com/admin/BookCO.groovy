package com.admin

import com.Author
import com.Book
import com.Publication
import com.Review
import com.SubCategory
import grails.validation.Validateable

@Validateable
class BookCO {
    String title
    String ISBN
    Long price
    Date releasedDate
    String description
    SubCategory subCategory
    Publication publication

    static belongsTo = [Author]
    static hasMany = [reviews:Review,authors:Author]
    static constraints = {
        title(nullable: false,blank: false)
        ISBN(nullable: false,blank: true)
        price(nullable: false)
        releasedDate(nullable: false)
        description(nullable: true)
    }

    def populateDataFromParams(def params){
        def subCategoryId=params.subcategory as Long
        SubCategory subCategory1=SubCategory.findById(subCategoryId)

        def publicationId=params.publication as Long
        Publication publication1=Publication.findById(publicationId)
        this.title=params.title
        this.ISBN=params.ISBN
        this.price=(params.price?:'0') as Long
        this.releasedDate=AppUtil.getDateFromIndividualDateParameter(params.releasedDate_day, params.releasedDate_month, params.releasedDate_year)
        println(this.releasedDate)
        this.description=params.description
        this.subCategory=subCategory1
        this.publication=publication1
    }
    Book populateDataFromBookCO()
    {
        Book book=new Book()
        book.ISBN=this.ISBN
        book.title=this.title
        book.price=this.price
        book.releasedDate=this.releasedDate
        book.description=this.description
        book.subCategory=this.subCategory
        book.publication=this.publication
        return book
    }
}
