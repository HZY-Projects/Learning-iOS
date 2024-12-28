//
//  Operation.swift
//  Learning
//
//  Created by  whatsup on 2024/11/17.
//

import Foundation

class Operations: Operation, @unchecked Sendable {
    
    let url: URL
    let queue: OperationQueue
    let count: [Int]
    
    init(url: URL, queue: OperationQueue, count: [Int]) {
        self.url = url
        self.queue = queue
        self.count = count
    }
    
    override func main() {
        
        for i in count {
            if self.isCancelled {
                break
            }
            print(self.isAsynchronous)
            let op = SingleOperation(url: URL(string: "http://www.baidu.com")!, scanout: i)
            op.queuePriority = .normal
//            op.addDependency(<#T##op: Operation##Operation#>)
            self.queue.addOperation(op)
        }
    }
    
// Because the NSOperation class is an abstract class, you do not use it directly but instead subclass or use one of the system-defined subclasses(NSInvocationOperation or NSBlockOperation) to perform the actual task.
//    init() {
//        let operation = Operation.init()
//        operation.start()
//        operation.main()
//        operation.completionBlock = {
//            print("--")
//        }
//        operation.cancel()
//        print("\(operation.isCancelled) \(operation.isExecuting) \(operation.isFinished) \(operation.isConcurrent) \(operation.isAsynchronous) \(operation.isReady) \(String(describing: operation.name))")
//    }
}
