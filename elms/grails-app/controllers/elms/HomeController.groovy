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
    @Secured(['ROLE_ADMIN', 'ROLE_STUDENT', 'ROLE_INSTRUCTOR'])
    def index(Integer max) { 
		def currentUser = springSecurityService.currentUser
		params.max = Math.min(max ?: 4, 100)
        def adminUser = SecRole.get(1)
        def student = SecRole.get(2)
        def instructor = SecRole.get(3)

        def role = currentUser.getAuthorities()
        def currentRole
        def courseList = []
        def courseListInstruc = []
        def allCourses = Course.list(params)
        

        if(role.contains(adminUser)){
            currentRole='admin'
            courseList = allCourses
        }
        // Instructor needs two lists
        if(role.contains(instructor)){
            currentRole='instructor'
            allCourses.each{it->
                if (it.instructor==currentUser){
                    courseListInstruc << it
                }
                it.students.each{user->
                    if (user==currentUser){
                        courseList << it
                    }
                }
            }
        }
        if(role.contains(student)){
            currentRole='student'
            allCourses.each{it->
                it.students.each{user->
                    if (user==currentUser){
                        courseList << it
                    }
                }
            }
        }

        println currentRole

		return [currentUser:currentUser, courseList:courseList, courseListInstruc:courseListInstruc, currentRole:currentRole] 
	}

    def request() {

    }
}
