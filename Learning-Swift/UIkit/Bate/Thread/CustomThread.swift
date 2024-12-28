//
//  CustomThread.swift
//  Learning
//
//  Created by  whatsup on 2024/11/20.
//

import Foundation

class CustomThread {
    
    init() {
        // invoke block
//        let thread = Thread {
//            print(Thread.current)
//        }
        // invole selector
//        let thread = Thread(target: self, selector: #selector(detachNewThread), object: nil)
//        thread.name = "thread1"
//        thread.start()
//        Thread.detachNewThreadSelector(#selector(detachNewThread), toTarget: self, with: nil)
        
//        let subThread = SubThread(data: Data())
//        subThread.qualityOfService = .default
//        
//        subThread.start()
//        
//        Thread.sleep(until: .now + 5)
//        print(1111)
    }
    
    @objc func detachNewThread() {
        print(Thread.current)
    }
    
    
//    func saleTickets() {
//        while true {
//            objc_sync_enter(self)
//
//            objc_sync_exit(self)
//        }
//    }
}

class SubThread: Thread {
    
    let data: Data
    
    init(data: Data) {
        self.data = data
    }
    
    override func main() {
        Thread.sleep(forTimeInterval: 2)
        Thread.setThreadPriority(1)
        print(Thread.current, Thread.current.isExecuting, Thread.current.isCancelled, Thread.current.isFinished, Thread.isMultiThreaded())
//        Thread.main
        print(Thread.callStackReturnAddresses, Thread.callStackSymbols)
        print("do something");
        
//        Thread.current.cancel()
        
        performSelector(onMainThread: #selector(dosomething), with: nil, waitUntilDone: false)
//        Thread.exit()
    }
    
    @objc func dosomething() {
        print(Thread.current)
    }
}
