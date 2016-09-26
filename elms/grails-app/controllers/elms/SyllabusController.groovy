package elms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SyllabusController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Syllabus.list(params), model:[syllabusInstanceCount: Syllabus.count()]
    }

    def show(Syllabus syllabusInstance) {
        respond syllabusInstance
    }

    def create() {
        respond new Syllabus(params)
    }

    @Transactional
    def save(Syllabus syllabusInstance) {
        if (syllabusInstance == null) {
            notFound()
            return
        }

        if (syllabusInstance.hasErrors()) {
            respond syllabusInstance.errors, view:'create'
            return
        }

        syllabusInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'syllabusInstance.label', default: 'Syllabus'), syllabusInstance.id])
                redirect syllabusInstance
            }
            '*' { respond syllabusInstance, [status: CREATED] }
        }
    }

    def edit(Syllabus syllabusInstance) {
        respond syllabusInstance
    }

    @Transactional
    def update(Syllabus syllabusInstance) {
        if (syllabusInstance == null) {
            notFound()
            return
        }

        if (syllabusInstance.hasErrors()) {
            respond syllabusInstance.errors, view:'edit'
            return
        }

        syllabusInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Syllabus.label', default: 'Syllabus'), syllabusInstance.id])
                redirect syllabusInstance
            }
            '*'{ respond syllabusInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Syllabus syllabusInstance) {

        if (syllabusInstance == null) {
            notFound()
            return
        }

        syllabusInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Syllabus.label', default: 'Syllabus'), syllabusInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'syllabusInstance.label', default: 'Syllabus'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
