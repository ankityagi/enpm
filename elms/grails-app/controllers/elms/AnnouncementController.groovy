package elms


import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN', 'ROLE_STUDENT', 'ROLE_INSTRUCTOR'])
class AnnouncementController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Announcement.list(params), model:[announcementInstanceCount: Announcement.count()]
    }

    def show(Announcement announcementInstance) {
        def currentUser = springSecurityService.currentUser
        def role = currentUser.getAuthorities().authority
        
        return [currentUser:currentUser, announcementInstance:announcementInstance, role:role]
    }

    def create() {
        def currentUser = springSecurityService.currentUser
        def courseId = params.id
        print courseId
        def courseInstance = Course.get(courseId)

        return [courseInstance:courseInstance, currentUser:currentUser]
    }

    @Transactional
    def save(Announcement announcementInstance) {
        def currentUser = springSecurityService.currentUser
        def courseId = params.courseId
        def courseInstance = Course.get(courseId)
        announcementInstance.creator = currentUser
        announcementInstance.clearErrors()
        if (announcementInstance == null) {
            notFound()
            return
        }

        if (announcementInstance.hasErrors()) {
            announcementInstance.errors.allErrors.each {
                println it
            }
            respond announcementInstance.errors, view:'create'
            return
        }

        announcementInstance.save flush:true
        def courseAnnouncements = courseInstance.announcements
        courseAnnouncements.add(announcementInstance)
        courseInstance.announcements = courseAnnouncements
        courseInstance.save flush:true


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'announcementInstance.label', default: 'Announcement'), announcementInstance.id])
                redirect(controller:"course", action:"showCourse", id:courseId)
            }
            redirect(controller:"course", action:"showCourse", id:courseId)
        }
    }

    def edit(Announcement announcementInstance) {
        respond announcementInstance
    }

    @Transactional
    def update(Announcement announcementInstance) {
        if (announcementInstance == null) {
            notFound()
            return
        }

        if (announcementInstance.hasErrors()) {
            respond announcementInstance.errors, view:'edit'
            return
        }

        announcementInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Announcement.label', default: 'Announcement'), announcementInstance.id])
                redirect announcementInstance
            }
            '*'{ respond announcementInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Announcement announcementInstance) {

        if (announcementInstance == null) {
            notFound()
            return
        }

        announcementInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Announcement.label', default: 'Announcement'), announcementInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'announcementInstance.label', default: 'Announcement'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
