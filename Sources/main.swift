import Foundation
import Kitura
import PromiseKit

class PromiseKitServerSide {
    func test(completion:@escaping (String)->()) {
        print("in test")
        firstly {
            return Promise.init(value: "promise")
            }.then { value in
                print("in then")
                completion(value)
            }.always {
                completion("done!");
        }
        
    }
    
}

// Create a new router
let router = Router()

// Handle HTTP GET requests to /
router.get("/") {
    request, response, next in
    
    PromiseKitServerSide().test(completion: { (result) in
        response.send(result)
    })
    
    RunLoop.main.run()
    
    response.send("done")
    next()
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8888, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()


