package com

import org.springframework.security.access.annotation.Secured

@Secured('permitAll')
class PublicController {
    def index() {}

    def contact(){
        render (view: '/contact')
    }
    def support(){
        render (view: '/support')
    }
    def store(){
        render (view: '/store')
    }
}
