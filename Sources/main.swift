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

let router = Router()
router.get("/") { request, response, next in
    PromiseKitServerSide().test(completion: { (result) in
        response.send(result)
    })
    RunLoop.main.run()
}

print("starting server")
Kitura.addHTTPServer(onPort: 8888, with: router)
Kitura.run()


