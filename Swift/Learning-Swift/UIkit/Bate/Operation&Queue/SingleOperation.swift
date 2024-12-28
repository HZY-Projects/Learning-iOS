//
//  SingleOperation.swift
//  Learning
//
//  Created by  whatsup on 2024/11/19.
//

import Foundation

class SingleOperation: Operation, @unchecked Sendable {
    
    let url: URL
    let scanout: Int
    
    init(url: URL, scanout: Int) {
        self.url = url
        self.scanout = scanout
    }
    
    override func main() {
        if isCancelled {
            return
        }
        
        print(isExecuting, isAsynchronous, isReady)
        
        print(Thread.current)
        print("isLoading + \(scanout)")
        sleep(UInt32(scanout))
        print("isFinish + \(scanout)")
    }
}
