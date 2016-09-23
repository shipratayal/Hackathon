package com

class Book {
    String title
    String ISBN
    Long price=0
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
}
