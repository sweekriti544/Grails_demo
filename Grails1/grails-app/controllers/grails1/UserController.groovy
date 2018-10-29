package grails1



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    def exportService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def test(){
        println("This is Test method")
        forward(action: 'index')
    }
    def login(){
        println "Logged in"
        def name=params.name as String
        def password=params.password as String
        def user=User.findByNameAndPassword(name,password)
        if(user) {
            forward(action: 'index')
        }else render(view: '../login')
    }

    def logout(){
        render(view: '../login')
    }
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        if(params?.extension && params.extension != "html") {


            response.contentType = grailsApplication.config.grails.mime.types[params.extension]
            response.setHeader("Content-disposition", "attachment; filename=users.${params.extension}")


            List fields = ["name", "email", "address", "password"]
            Map labels = ["name": "Name", "email": "Email", "address": "Address", "password": "Password"]

            // Formatter closure
            def upperCase = { domain, value ->
                return value.toUpperCase()
            }

            Map formatters = [name: upperCase]
            Map parameters = [title: "User List"]

            exportService.export(params.extension, response.outputStream, User.list(params), fields, labels, formatters, parameters)
        }

        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }
def home(){

}
    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
