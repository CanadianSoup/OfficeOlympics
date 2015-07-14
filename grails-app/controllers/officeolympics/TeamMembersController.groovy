package officeolympics



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TeamMembersController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TeamMembers.list(params), model:[teamMembersInstanceCount: TeamMembers.count()]
    }

    def show(TeamMembers teamMembersInstance) {
        respond teamMembersInstance
    }

    def create() {
        respond new TeamMembers(params)
    }

    @Transactional
    def save(TeamMembers teamMembersInstance) {
        if (teamMembersInstance == null) {
            notFound()
            return
        }

        if (teamMembersInstance.hasErrors()) {
            respond teamMembersInstance.errors, view:'create'
            return
        }

        teamMembersInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'teamMembers.label', default: 'TeamMembers'), teamMembersInstance.id])
                redirect teamMembersInstance
            }
            '*' { respond teamMembersInstance, [status: CREATED] }
        }
    }

    def edit(TeamMembers teamMembersInstance) {
        respond teamMembersInstance
    }

    @Transactional
    def update(TeamMembers teamMembersInstance) {
        if (teamMembersInstance == null) {
            notFound()
            return
        }

        if (teamMembersInstance.hasErrors()) {
            respond teamMembersInstance.errors, view:'edit'
            return
        }

        teamMembersInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TeamMembers.label', default: 'TeamMembers'), teamMembersInstance.id])
                redirect teamMembersInstance
            }
            '*'{ respond teamMembersInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TeamMembers teamMembersInstance) {

        if (teamMembersInstance == null) {
            notFound()
            return
        }

        teamMembersInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TeamMembers.label', default: 'TeamMembers'), teamMembersInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'teamMembers.label', default: 'TeamMembers'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
