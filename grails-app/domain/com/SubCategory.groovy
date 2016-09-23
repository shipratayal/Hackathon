package com

class SubCategory {

    String name
    Category category

    static hasMany = [books:Book]

    static constraints = {
        name(nullable: false,blank: false)
    }
}
