package elms


import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import elms.auth.SecUser
import elms.auth.SecRole
import elms.auth.SecUserSecRole

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN', 'ROLE_STUDENT', 'ROLE_INSTRUCTOR'])
class CourseController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def currentUser = springSecurityService.currentUser
        params.max = Math.min(max ?: 10, 100)
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

        println currentRole + " looking at courses"
        return [currentUser:currentUser, courseList:courseList, courseListInstruc:courseListInstruc, currentRole:currentRole]
    }

    def showCourse(Course courseInstance) {
        def currentUser = springSecurityService.currentUser
        // params.max = Math.min(max ?: 10, 100)
        def adminUser = SecRole.get(1)
        def student = SecRole.get(2)
        def instructor = SecRole.get(3)

        def role = currentUser.getAuthorities()
        def currentRole = []
        def courseAnnouncements = courseInstance.announcements
        def courseAssignments = courseInstance.assignments

        if(role.contains(adminUser)){
            currentRole='admin'
        }
        // Instructor needs two lists
        if(role.contains(instructor)){
            currentRole='instructor'
        }

        if(role.contains(student)){
            currentRole='student'
        }

        courseAssignments = courseAssignments.sort{ it.dateCreated}
        courseAssignments = courseAssignments.reverse(true)
        println currentRole + " looking at showcourses"
        return [currentUser:currentUser, currentRole:currentRole, courseAnnouncements:courseAnnouncements,courseInstance:courseInstance,
        courseAssignments:courseAssignments]
    }

    def show(Course courseInstance) {
        return [courseInstance:courseInstance]
    }

    def create() {
        def currentUser = springSecurityService.currentUser

        respond new Course(params), model:[currentUser:currentUser]
    }

    @Transactional
    def save(Course courseInstance) {
        if (courseInstance == null) {
            notFound()
            return
        }

        if (courseInstance.hasErrors()) {
            respond courseInstance.errors, view:'create'
            return
        }

        courseInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'courseInstance.label', default: 'Course'), courseInstance.id])
                redirect courseInstance
            }
            '*' { respond courseInstance, [status: CREATED] }
        }
    }

    def edit(Course courseInstance) {
        respond courseInstance
    }

    @Transactional
    def update(Course courseInstance) {
        if (courseInstance == null) {
            notFound()
            return
        }

        if (courseInstance.hasErrors()) {
            respond courseInstance.errors, view:'edit'
            return
        }

        courseInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Course.label', default: 'Course'), courseInstance.id])
                redirect action:"index"
            }
            redirect action:"index"
        }
    }

    @Transactional
    def delete(Course courseInstance) {

        if (courseInstance == null) {
            notFound()
            return
        }

        courseInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Course.label', default: 'Course'), courseInstance.id])
                redirect action:"index", method:"GET"
            }
            redirect action:"index"
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'courseInstance.label', default: 'Course'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
