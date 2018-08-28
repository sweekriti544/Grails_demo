package grails1

class TestController {

    def test() {
        println("This is Test page")
     forward(controller: 'user',action: 'test')
    }
}
