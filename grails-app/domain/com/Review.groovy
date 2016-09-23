package com

import com.bookstore.User

class Review {

    String message
    User user

    static belongsTo = [book:Book]

    static constraints = {
        message(nullable: false)
    }
}
