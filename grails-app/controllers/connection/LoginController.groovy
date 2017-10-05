package connection
import grails.converters.JSON
class LoginController {

    def index() { }

    def loginSuccess(){
        session.user=params.fullName
        session.photo=params.profilePhoto
        session.email=params.email

        response.setContentType('application/json')


        try {

            println params
            render 200
//            render(200,"${['status': "OK" ] as JSON}")
//            def userName=params.fullName
//            def profileUrl=params.profilePhoto
          }
        catch (RuntimeException exception) {
            log.error "Error during operation " + exception.message,exception
            render(status: 500, "${['status': "Login ERROR"] as JSON}")
        }
    }
    def logout(){
        session.user = null
        redirect(action: 'index')
    }
}
