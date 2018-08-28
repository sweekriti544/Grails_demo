package grails1

class User {
    String name
    String email
    String address
    String password
    static constraints = {
        name(nullable: false,minSize: 4)
        address(nullable: false)
        password(nullable: false)
        email(nullable: false,email: true)
        email email:true
    }
}
