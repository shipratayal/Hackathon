package com

import com.bookstore.Role
import com.bookstore.User
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured

class CustomerController {

    def springSecurityService

    @Secured(['permitAll'])
    def index() {
        flash.clear()
        User user=springSecurityService.currentUser as User
        if(user){
            println("I am inside the Customer index "+user.username)
            if (user.authorities.contains(Role.findByAuthority('ROLE_USER'))){
                redirect (action: 'home')
            }
            else{
                redirect(action: 'index',controller: 'admin')
            }
        }
        render (view: 'index')
    }
    @Secured(['ROLE_USER','ROLE_ADMIN'])
    def home(){
        println("Hellllllllllllll")
        User user=springSecurityService.currentUser as User
        if (user.authorities.contains(Role.findByAuthority('ROLE_ADMIN'))){
            redirect(action: 'index',controller: 'admin')
        }
        render (view: 'index')
    }

    @Secured(['permitAll'])
    def reauthenticate(){
        println("HHHHHHHAAAA")
        def config = SpringSecurityUtils.securityConfig

        if (springSecurityService.isLoggedIn()) {
            redirect uri: config.successHandler.defaultTargetUrl
            return
        }

        String view = 'reauthenticate'
        String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
        render view: view, model: [postUrl: postUrl,
                                   rememberMeParameter: config.rememberMe.parameter]
    }
}
