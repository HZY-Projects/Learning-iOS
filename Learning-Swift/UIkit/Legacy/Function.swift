//
//  Function.swift
//  Learning
//
//  Created by  whatsup on 2024/10/29.
//

import Foundation

struct Function {
    
    // 可变参数
    func arithmeticMean(_ numbers: Double...) -> Double {
        var total: Double = 0
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }
    
    // 输入输出型参数
    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        a += 100
        b = a + 1
    }
    
    // 函数类型参数
    func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
        print("Result: \(mathFunction(a, b))")
    }
    
    // 函数返类型回值
    func chooseStepFunction(backward: Bool) -> (Int, Int) -> Int {
        return backward ? addTwoInts : changeTwoInts
    }
    
    // 嵌套函数
    func nestedFunc() -> (Int) -> Int {
        func func1(_ a: Int) -> Int { a + 1 }
        return func1
    }
    
    var t1: Int = 0
    var t2: Int = 2
    init() {
        let value = arithmeticMean(1, 2, 4)
        print(value)
        swapTwoInts(&t1, &t2)
        print(t1, t2)
        
        let temps: (Int, Int) -> Int = addTwoInts
        print(temps(1, 4))
        
        printMathResult(addTwoInts, 1, 1)
        
        // 闭包
        func backward(_ s1: String, _ s2: String) -> Bool {
            return s1 > s2
        }
        var reversedNames = ["String","String1"].sorted(by: backward)
        reversedNames = ["String","String1"].sorted(by: { (a: String, b: String) -> Bool in return a > b })
        reversedNames = ["String","String1"].sorted(by: { a, b in a > b })
        reversedNames = ["String","String1"].sorted(by: { $0 > $1 })
        reversedNames = ["String","String1"].sorted(by: >)
        print(reversedNames)
        
        func blockFunc(closure: (Int) -> Void) {
            
        }
        blockFunc(closure: { _ in })
        // 尾随闭包
        blockFunc { _ in
            
        }
//        someFunctionWithNonescapingClosure {
//            print(1111)
//        }
//        
//        someFunctionWithEscapingClosure {
//            print(1112)
//        }
        
        // 自动闭包 自动闭包让你能够延迟求值，因为直到你调用这个闭包，代码段才会被执行
        var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        let customerProvider = { customersInLine.remove(at: 0) }
        print(customersInLine.count)
    }
    
//    var closureBlock: (() -> Void)? = nil
//    // 逃逸闭包在方法返回后仍然可以执行 它逃出了方法的作用域 适用于异步耗时操作等
      // 非逃逸闭包 本质就是函数当作入参传入 在方法返回之前执行完成
//    func someFunctionWithNonescapingClosure(closure: () -> Void) {
////        closureBlock = closure
//        closure()
//    }
//
//    func someFunctionWithEscapingClosure(closure: @escaping () -> Void) {
//        closureBlock = closure
//        closure()
//    }

    
    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func changeTwoInts(_ a: Int, _ b: Int) -> Int {
        return a - b
    }
}
