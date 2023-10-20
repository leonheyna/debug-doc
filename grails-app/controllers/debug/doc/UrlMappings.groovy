package debug.doc

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "/effed"(view:"/get/effed")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
