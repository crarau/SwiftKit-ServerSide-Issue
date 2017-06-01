//
//  PromiseKitServerSide.swift
//  promisekit-serverside-issue
//
//  Created by Ciprian Rarau on 2017-05-31.
//
//

import Foundation
import PromiseKit

class PromiseKitServerSide {
    func test() {
        
        firstly {
            self.first()
            }.then { value in
                self.second(value: value)
            }.then { values in
                print(values)
            }.always {
                print("Done!")
        }
        
        RunLoop.main.run()

    }
    
    func first() -> Promise<String> {
        return Promise { fulfill, reject in
            fulfill("value")
        }
    }
    
    func second(value: String) -> Promise<[String]> {
        return Promise { fulfill, reject in
            fulfill([value])
        }
    }
}
