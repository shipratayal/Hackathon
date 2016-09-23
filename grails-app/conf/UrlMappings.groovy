class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'customer', action: "index")
        "/contact"(controller: 'public',action: 'contact')
//        "/myAccount"(controller: 'login', action: 'auth')
        "/support"(controller: 'public',action: 'support')
        "/store"(controller: 'public',action: 'store')
        "/admin"(controller: 'admin',action: 'index')
        "500"(view:'/error')
	}
}
