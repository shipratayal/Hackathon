package com

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class AdminController {

    def adminService
    def index() {
        println("Inside the admin")
//        render "Admin"
    }


















}
