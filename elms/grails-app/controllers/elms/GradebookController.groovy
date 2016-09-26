package elms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GradebookController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Gradebook.list(params), model:[gradebookInstanceCount: Gradebook.count()]
    }

    def show(Gradebook gradebookInstance) {
        respond gradebookInstance
    }

    def create() {
        respond new Gradebook(params)
    }

    @Transactional
    def save(Gradebook gradebookInstance) {
        if (gradebookInstance == null) {
            notFound()
            return
        }

        if (gradebookInstance.hasErrors()) {
            respond gradebookInstance.errors, view:'create'
            return
        }

        gradebookInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'gradebookInstance.label', default: 'Gradebook'), gradebookInstance.id])
                redirect gradebookInstance
            }
            '*' { respond gradebookInstance, [status: CREATED] }
        }
    }

    def edit(Gradebook gradebookInstance) {
        respond gradebookInstance
    }

    @Transactional
    def update(Gradebook gradebookInstance) {
        if (gradebookInstance == null) {
            notFound()
            return
        }

        if (gradebookInstance.hasErrors()) {
            respond gradebookInstance.errors, view:'edit'
            return
        }

        gradebookInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Gradebook.label', default: 'Gradebook'), gradebookInstance.id])
                redirect gradebookInstance
            }
            '*'{ respond gradebookInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Gradebook gradebookInstance) {

        if (gradebookInstance == null) {
            notFound()
            return
        }

        gradebookInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Gradebook.label', default: 'Gradebook'), gradebookInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'gradebookInstance.label', default: 'Gradebook'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
