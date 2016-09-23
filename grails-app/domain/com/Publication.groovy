package com

class Publication {

    String name
    Date startDate

    static hasMany = [books:Book]
    static constraints = {
        name(nullable: false)
    }
}
