package com.admin

import com.Category
import com.SubCategory
import grails.validation.Validateable

@Validateable
class CategoryCO {
    String name
    static hasMany = [subCategories:SubCategory]
    static constraints = {
        name(nullable: false,blank: false)
    }


    Category populateDataFromCategoryCO(){
        Category category=new Category()
        category.name=this?.name
        return category
    }
    def populateDataFromParams(def params){
        this.name=params.name
    }
}
