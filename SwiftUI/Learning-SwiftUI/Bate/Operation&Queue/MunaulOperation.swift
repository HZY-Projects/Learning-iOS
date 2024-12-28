//
//  MunaulOperation.swift
//  Learning
//
//  Created by  whatsup on 2024/11/19.
//

import Foundation

class MunaulOperation: Operation, @unchecked Sendable {
    override func main() {
        if !isReady {
            return
        }
        if let name = name {
//            print(isAsynchronous)
            print(name + " isExecuting "  + "\(isExecuting) " + "\(Thread.current)" )
        }
        sleep(3)
    }
}
