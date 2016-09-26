package grails.plugin.springsecurity.ui



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RegistrationCodeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RegistrationCode.list(params), model:[registrationCodeInstanceCount: RegistrationCode.count()]
    }

    def show(RegistrationCode registrationCodeInstance) {
        respond registrationCodeInstance
    }

    def create() {
        respond new RegistrationCode(params)
    }

    @Transactional
    def save(RegistrationCode registrationCodeInstance) {
        if (registrationCodeInstance == null) {
            notFound()
            return
        }

        if (registrationCodeInstance.hasErrors()) {
            respond registrationCodeInstance.errors, view:'create'
            return
        }

        registrationCodeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'registrationCodeInstance.label', default: 'RegistrationCode'), registrationCodeInstance.id])
                redirect registrationCodeInstance
            }
            '*' { respond registrationCodeInstance, [status: CREATED] }
        }
    }

    def edit(RegistrationCode registrationCodeInstance) {
        respond registrationCodeInstance
    }

    @Transactional
    def update(RegistrationCode registrationCodeInstance) {
        if (registrationCodeInstance == null) {
            notFound()
            return
        }

        if (registrationCodeInstance.hasErrors()) {
            respond registrationCodeInstance.errors, view:'edit'
            return
        }

        registrationCodeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RegistrationCode.label', default: 'RegistrationCode'), registrationCodeInstance.id])
                redirect registrationCodeInstance
            }
            '*'{ respond registrationCodeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RegistrationCode registrationCodeInstance) {

        if (registrationCodeInstance == null) {
            notFound()
            return
        }

        registrationCodeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RegistrationCode.label', default: 'RegistrationCode'), registrationCodeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'registrationCodeInstance.label', default: 'RegistrationCode'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
