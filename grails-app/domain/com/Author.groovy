package com

class Author {
    String name
    static hasMany = [books:Book]

    static constraints = {
        name(nullable: false)
    }
//    static mapping = {
//        books cascade: "all-delete-orphan"
//    }
}
