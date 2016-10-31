package elms

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils
import elms.auth.SecUser
import elms.auth.SecRole
import elms.auth.SecUserSecRole

class HomeController {
	 def springSecurityService

     static allowedMethods = [
        index: 'GET', update: "PUT"
    ]
	 
	/**
	 * Front page 
	 * 
	 * @return
	 */
    @Secured(['ROLE_ADMIN', 'ROLE_ANALYST', 'ROLE_USER'])
    def index(Integer max) { 
		def currentUser = springSecurityService.currentUser
		params.max = Math.min(max ?: 4, 100)
		respond Course.list(params), model:[currentUser:currentUser] 
	}
}
