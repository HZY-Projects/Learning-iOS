//
//  ContentVM.swift
//  Learning
//
//  Created by  whatsup on 2024/10/31.
//

import Foundation


class ContentVM: ObservableObject {

    var temp = 10
    func addressScan(a: inout Int) {
        a += temp
    }
    
    func testAny(param: any Sendable) {
        
    }
}
