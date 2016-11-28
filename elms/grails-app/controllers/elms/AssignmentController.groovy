package elms


import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import elms.auth.SecUser
import elms.auth.SecRole
import elms.auth.SecUserSecRole

@Transactional(readOnly = true)

class AssignmentController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    @Secured(['ROLE_ADMIN', 'ROLE_STUDENT', 'ROLE_INSTRUCTOR'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Assignment.list(params), model:[assignmentInstanceCount: Assignment.count()]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_STUDENT', 'ROLE_INSTRUCTOR'])
    def show(Assignment assignmentInstance) {
        def currentUser = springSecurityService.currentUser
        def role = currentUser.getAuthorities().authority
        // Get list of attachements
        def documentList = Document.findAllByTypeAndTypeId('assignment',assignmentInstance.id)
        def courseId = params.courseId

        return [currentUser:currentUser, role:role, assignmentInstance:assignmentInstance,documentList:documentList, courseId:courseId]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_STUDENT', 'ROLE_INSTRUCTOR'])
    def myGrades(Assignment assignmentInstance) {
        def currentUser = springSecurityService.currentUser
        def role = currentUser.getAuthorities().authority
        
        def courseId = params.courseId
        def courseInstance = Course.get(courseId)
        def gradesList = Gradebook.findAllByStudentsAndCourses(currentUser, courseInstance)
        def sumMax = 0
        def sumScore = 0
        gradesList.each{grade->
            sumMax = sumMax + grade.assignments.maxScore
            sumScore = grade.score
        }
        def percentage = Math.round(sumScore *100/ sumMax)
        

        return [currentUser:currentUser, role:role, gradesList:gradesList, courseId:courseId, percentage:percentage,
        sumMax:sumMax, sumScore:sumScore
        ]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_STUDENT', 'ROLE_INSTRUCTOR'])
    @Transactional
    def submitAssignment(Assignment assignmentInstance) {
        print params
        def object = params.object

        def currentUser = springSecurityService.currentUser
        def courseId = params.courseId
        def courseInstance = Course.get(courseId)

        
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
                    if (object == 'assignmentSubmission') {
                        documentInstance.type = object
                        documentInstance.typeId = assignmentInstance?.id
                        documentInstance.course =courseInstance
                    }
                    print "full path = " + grailsApplication.config.uploadFolder +  File.separator + object + File.separator + assignmentInstance?.id
                    def storagePathDirectory = new File(grailsApplication.config.uploadFolder +  File.separator + object + File.separator + assignmentInstance?.id)
                    
                    if (!storagePathDirectory.exists()) {
                        if (storagePathDirectory.mkdirs()) {
                            println "SUCCESS"
                        } else {
                            println "FAILED"
                        }
                    }

                    def filename = f.originalFilename
                    documentInstance.fullPath = new File(grailsApplication.config.uploadFolder  +  File.separator + object + File.separator + assignmentInstance?.id + File.separator + filename)
                    f.transferTo(new File(documentInstance.fullPath))
                    documentInstance.fullPath = new File(File.separator + "uploads"  +  File.separator + object + File.separator + assignmentInstance?.id + File.separator +  filename)
                    documentInstance.course = courseInstance
                    documentInstance.creator = currentUser
                    documentInstance.save(failOnError: true)
                    }
                }
            }
        }

        if (!allfiles){
            request.withFormat {
            form multipartForm {
                flash.message = "Did not find the file"
                redirect(controller:"course", action:"showCourse", id:courseId)
            }
        }

        } else {
            request.withFormat {
            form multipartForm {
                flash.message = "Your assignment was successfully submitted"
                redirect(controller:"course", action:"showCourse", id:courseId)
            }
        }

        }

        
    }

    @Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR'])
    def grade(Assignment assignmentInstance) {
        def currentUser = springSecurityService.currentUser
        def role = currentUser.getAuthorities().authority
        def courseId = params.courseId
        // Get list of attachements
        def documentList = Document.findAllByTypeAndTypeId('assignmentSubmission',assignmentInstance.id)

        return [currentUser:currentUser, role:role, assignmentInstance:assignmentInstance,documentList:documentList,courseId:courseId]
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
    def saveGrade(Assignment assignmentInstance) {
        print params
        def object = params.object
        def currentUser = springSecurityService.currentUser
        def courseId = params.courseId
        def courseInstance = Course.get(courseId)

        def students=params.findAll{it.key.startsWith("grade_")}
        print students
        students.each{ k,v->
            print "it -> " + k + " val->" + v
            def userId = k.drop(6) as Integer
            def grade = v
            def userInstance = SecUser.get(userId)
            def gradebookInstance = new Gradebook (
            creator: currentUser,
            students: userInstance,
            assignments: assignmentInstance,
            courses: courseInstance,
            score:grade
            ).save(flush:true, failOnError:true)

        }
        
        redirect(action:"show", id:"${assignmentInstance.id}")
    }

    @Transactional
    @Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR'])
    def save(Assignment assignmentInstance) {
        print params
        def object = params.object
        def currentUser = springSecurityService.currentUser
        def courseId = params.courseId
        def courseInstance = Course.get(courseId)

        assignmentInstance.creator = currentUser
        assignmentInstance.clearErrors()
        if (assignmentInstance == null) {
            notFound()
            return
        }

        if (assignmentInstance.hasErrors()) {
            respond assignmentInstance.errors, view:'create'
            return
        }

        assignmentInstance.save flush:true
        def assignments = courseInstance.assignments
        assignments.add(assignmentInstance)
        courseInstance.assignments = assignments
        courseInstance.save flush:true


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
                    if (object == 'assignment') {
                        documentInstance.type = object
                        documentInstance.typeId = assignmentInstance?.id
                        documentInstance.course =courseInstance
                    }
                    print "full path = " + grailsApplication.config.uploadFolder +  File.separator + object + File.separator + assignmentInstance?.id
                    def storagePathDirectory = new File(grailsApplication.config.uploadFolder +  File.separator + object + File.separator + assignmentInstance?.id)
                    
                    if (!storagePathDirectory.exists()) {
                        if (storagePathDirectory.mkdirs()) {
                            println "SUCCESS"
                        } else {
                            println "FAILED"
                        }
                    }

                    def filename = f.originalFilename
                    documentInstance.fullPath = new File(grailsApplication.config.uploadFolder  +  File.separator + object + File.separator + assignmentInstance?.id + File.separator + filename)
                    f.transferTo(new File(documentInstance.fullPath))
                    documentInstance.fullPath = new File(File.separator + "uploads"  +  File.separator + object + File.separator + assignmentInstance?.id + File.separator +  filename)
                    documentInstance.creator = currentUser
                    documentInstance.save(failOnError: true)
                    }
                }
            }
        }


        

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'assignmentInstance.label', default: 'Assignment'), assignmentInstance.id])
                redirect(controller:"course", action:"showCourse", id:courseId)
            }
            redirect(controller:"course", action:"showCourse", id:courseId)
        }
    }
    @Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR'])
    def edit(Assignment assignmentInstance) {
        respond assignmentInstance
    }

    @Transactional
    @Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR'])
    def update(Assignment assignmentInstance) {
        if (assignmentInstance == null) {
            notFound()
            return
        }

        if (assignmentInstance.hasErrors()) {
            respond assignmentInstance.errors, view:'edit'
            return
        }

        assignmentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Assignment.label', default: 'Assignment'), assignmentInstance.id])
                redirect assignmentInstance
            }
            '*'{ respond assignmentInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR'])
    def delete(Assignment assignmentInstance) {

        if (assignmentInstance == null) {
            notFound()
            return
        }

        assignmentInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Assignment.label', default: 'Assignment'), assignmentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'assignmentInstance.label', default: 'Assignment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
