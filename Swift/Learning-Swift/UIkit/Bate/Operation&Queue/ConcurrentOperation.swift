//
//  ConcurrentOperation.swift
//  Learning
//
//  Created by  whatsup on 2024/11/19.
//

import Foundation

class ConcurrentOperation: Operation, @unchecked Sendable {
    
    var executings: Bool = false
    var finisheds: Bool = false

    override var isAsynchronous: Bool {
        true
    }
    
    override var isExecuting: Bool {
        executings
    }
    
    override var isFinished: Bool {
        finisheds
    }
    
    override func start() {
        if isCancelled {
            willChangeValue(forKey: "isFinished")
            finisheds = true
            didChangeValue(forKey: "isFinished")
            return
        }
        
        willChangeValue(forKey: "isExecuting")
        executings = true
        Thread.detachNewThreadSelector(#selector(main), toTarget: self, with: nil)
        didChangeValue(forKey: "isExecuting")
    }
    
    override func main() {
        
        print(isAsynchronous, Thread.current, name ?? "")
        
        sleep(5)
        
        willChangeValue(forKey: "isExecuting")
        willChangeValue(forKey: "isFinished")
        executings = false
        finisheds = true
        didChangeValue(forKey: "isExecuting")
        didChangeValue(forKey: "isFinished")
    }
}
