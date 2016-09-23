package com

class Category {
    String name

    static hasMany = [subCategories:SubCategory]

    static constraints = {
        name(nullable: false,blank: false)
    }
}
