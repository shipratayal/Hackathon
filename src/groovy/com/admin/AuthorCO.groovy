package com.admin

import com.Author
import com.Book
import grails.validation.Validateable

@Validateable
class AuthorCO {
    String name

    static constraints = {
        name(nullable: false,blank: false)
    }

    Author populateDataFromAuthorCO(){
        Author author=new Author()
        author.name=this?.name
        return author
    }
    def populateDataFromParams(def params){
        this?.name=params.name
    }
}
