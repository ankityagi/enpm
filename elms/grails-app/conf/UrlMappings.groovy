class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"{
             controller = "home"
             action = "login"
            }
            
        "500"(view:'/error')
	}
}
