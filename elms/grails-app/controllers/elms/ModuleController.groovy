package elms



import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import elms.auth.SecUser
import elms.auth.SecRole
import elms.auth.SecUserSecRole

@Transactional(readOnly = true)
class ModuleController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Module.list(params), model:[moduleInstanceCount: Module.count()]
    }

    def show(Module moduleInstance) {
        respond moduleInstance
    }

    @Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR'])
    def create() {
        def currentUser = springSecurityService.currentUser
        def courseId = params.id
        print courseId
        def courseInstance = Course.get(courseId)
        print "full path = " + grailsApplication.config.uploadFolder
        return [courseInstance:courseInstance, currentUser:currentUser]
    }

    @Transactional
    @Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR'])
    def save(Module moduleInstance) {
        print params
        def object = params.object
        def currentUser = springSecurityService.currentUser
        def courseId = params.courseId
        def courseInstance = Course.get(courseId)

        // moduleInstance.creator = currentUser
        // moduleInstance.clearErrors()
        // if (moduleInstance == null) {
        //     notFound()
        //     return
        // }

        // if (moduleInstance.hasErrors()) {
        //     respond moduleInstance.errors, view:'create'
        //     return
        // }

        // moduleInstance.save flush:true
        // def assignments = courseInstance.assignments
        // assignments.add(moduleInstance)
        // courseInstance.assignments = assignments
        // courseInstance.save flush:true


        def allfiles = request.getFileNames()
        def documentInstance
        print "allfiles "  + allfiles
        allfiles.each{ name->
            print "name = " + name
            if (name.equals('files[]')) { //make sure to get the multifiles only

                request.getFiles(name).each {f->

                    if(f.empty) {
                    flash.message = "File cannot be empty"
                } else {

                    print "f.originalFilename " + f.originalFilename
                    documentInstance = new Document()
                    documentInstance.filename =  f.originalFilename
                    if (object == 'module') {
                        documentInstance.type = object
                        documentInstance.typeId = courseInstance?.id
                        documentInstance.course =courseInstance
                    }
                    print "full path = " + grailsApplication.config.uploadFolder +  File.separator + object + File.separator + courseInstance?.id
                    def storagePathDirectory = new File(grailsApplication.config.uploadFolder +  File.separator + object + File.separator + courseInstance?.id)
                    
                    if (!storagePathDirectory.exists()) {
                        if (storagePathDirectory.mkdirs()) {
                            println "SUCCESS"
                        } else {
                            println "FAILED"
                        }
                    }

                    def filename = f.originalFilename
                    documentInstance.fullPath = new File(grailsApplication.config.uploadFolder  +  File.separator + object + File.separator + courseInstance?.id + File.separator + filename)
                    f.transferTo(new File(documentInstance.fullPath))
                    documentInstance.fullPath = new File(File.separator + "uploads"  +  File.separator + object + File.separator + courseInstance?.id + File.separator +  filename)
                    documentInstance.creator = currentUser
                    documentInstance.save(failOnError: true)
                    }
                }
            }
        }


        

        request.withFormat {
            form multipartForm {
                flash.message = "Module has been added to the course"
                redirect(controller:"course", action:"showCourse", id:courseId)
            }
            redirect(controller:"course", action:"showCourse", id:courseId)
        }
    }

    def edit(Module moduleInstance) {
        respond moduleInstance
    }

    @Transactional
    def update(Module moduleInstance) {
        if (moduleInstance == null) {
            notFound()
            return
        }

        if (moduleInstance.hasErrors()) {
            respond moduleInstance.errors, view:'edit'
            return
        }

        moduleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Module.label', default: 'Module'), moduleInstance.id])
                redirect moduleInstance
            }
            '*'{ respond moduleInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR'])
    def delete(Module moduleInstance) {

        if (moduleInstance == null) {
            notFound()
            return
        }

        moduleInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Module.label', default: 'Module'), moduleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'moduleInstance.label', default: 'Module'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
