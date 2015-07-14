package officeolympics



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MedalsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Medals.list(params), model:[medalsInstanceCount: Medals.count()]
    }

    def show(Medals medalsInstance) {
        respond medalsInstance
    }

    def create() {
        respond new Medals(params)
    }

    @Transactional
    def save(Medals medalsInstance) {
        if (medalsInstance == null) {
            notFound()
            return
        }

        if (medalsInstance.hasErrors()) {
            respond medalsInstance.errors, view:'create'
            return
        }

        medalsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'medals.label', default: 'Medals'), medalsInstance.id])
                redirect medalsInstance
            }
            '*' { respond medalsInstance, [status: CREATED] }
        }
    }

    def edit(Medals medalsInstance) {
        respond medalsInstance
    }

    @Transactional
    def update(Medals medalsInstance) {
        if (medalsInstance == null) {
            notFound()
            return
        }

        if (medalsInstance.hasErrors()) {
            respond medalsInstance.errors, view:'edit'
            return
        }

        medalsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Medals.label', default: 'Medals'), medalsInstance.id])
                redirect medalsInstance
            }
            '*'{ respond medalsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Medals medalsInstance) {

        if (medalsInstance == null) {
            notFound()
            return
        }

        medalsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Medals.label', default: 'Medals'), medalsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'medals.label', default: 'Medals'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
