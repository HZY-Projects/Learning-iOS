//
//  LearningApp.swift
//  Learning
//
//  Created by  whatsup on 2024/10/26.
//

import SwiftUI

@main
struct LearningApp: App {
    
    
//    class func t1() {
//        //子类可以重写父类的方法
//    }
    static var ticketCount = 10;
    
    static func t2() {
        
    }
    
    // 自定义下标
    subscript(index: Int) -> Int {
        get {
          // 返回一个适当的 Int 类型的值
            return 1
        }
        set(newValue) {
          // 执行适当的赋值操作
        }
    }
    
   
    init() {
        // 响应式编程： 典型例子就是RAC RXSwift 事件流的方式编程 链式语法
        // OOP: 面向对象编程 OC 继承方式 创建类对象 通过对象调用方法 并通过继承的方式调用或重写父类的方法 抽出一个很小的东西 牵一发动全身
        // POP: 面向协议编程 Swift 协议方式 协议提供协议方式 遵循协议要实现协议的方法 可以遵循多个协议 需要那个遵循那个 抽出来也方便 需要什么用什么
        let _ = Function()
        let _ = Good()
        let _ = CustomThread()
//        let _ = GCD()
        let _ = Socket()
      
//        let a = RunLoops()
//        sleep(5)
//        a.clickOne()
//        sleep(1)
//        a.clickOne()
//        sleep(1)
//        a.clickOne()
        // 第一种方式 直接使用Operation 使用OperationQueue  重写main 在里边执行耗时操作 然后添加operation queue执行
        
        //        let queue = OperationQueue()
        //        let op = Operations(url: URL(string: "http//:www.baidu.com")!, queue: queue, count: [1,2,3])
        //        queue.maxConcurrentOperationCount = 2;
        //        queue.addOperation(op)
        //        queue.cancelAllOperations()
        //        queue.waitUntilAllOperationsAreFinished()
        //        op.completionBlock = {
        //            // 执行完就算 耗时操作后执行 这里先执行
        //            print("op finish")
        //        }
        
//        let queues = OperationQueue()
        //        let queues = OperationQueue.main
        //        let queues = OperationQueue.current
//        queues.maxConcurrentOperationCount = 4
//        
//        var array = [MunaulOperation]()
//        for i in 1...10 {
//            let op1 = MunaulOperation()
//            op1.name = "op + \(i)"
//            op1.completionBlock = {
//                print("op\(i) finished")
//            }
//            array.append(op1)
//        }
//        queues.addOperations(array, waitUntilFinished: false)
        
//                let op2 = MunaulOperation()
//                op2.name = "op2"
//                op2.queuePriority = .veryHigh
//                op2.completionBlock = {
//                    print("op2 finished")
//                }
        
        // op1 先执行完 依赖
        //        op2.addDependency(op1)
        
        //        queues.addOperation {
        //            OperationQueue().addOperation(op1)
        //            OperationQueue().addOperation(op2)
        //        }
        
//                queues.addOperations([op1, op2], waitUntilFinished: false)
        //        queues.waitUntilAllOperationsAreFinished()
        //        queues.cancelAllOperations()
        //        queues.addBarrierBlock {
        //            print(333)
        //        }
        
        //        print("nowaitUntilFinished")
        
        //        let bo1 = BlockOperation()
        //        let bo1 = BlockOperation {
        //            sleep(2)
        //            print(Thread.current, "bo1 init isFinish")
        //        }
        //        bo1.name = "bo1Operation"
        //        bo1.addExecutionBlock {
        //            sleep(2)
        //            print(Thread.current, "bo1 add isFinish")
        //        }
        //        bo1.start()
        //        let queue = OperationQueue()
        //        let bo1 = BlockOperation {
        //            sleep(2)
        //            print(Thread.current, "bo1 init isFinish")
        //        }
        //        bo1.name = "bo1Operation"
        //        bo1.addExecutionBlock {
        //            sleep(2)
        //            print(Thread.current, "bo1 add isFinish")
        //        }
        //        let bo2 = BlockOperation {
        //            sleep(2)
        //            print(Thread.current, "bo2 init isFinish")
        //        }
        //        queue.addOperation(bo1)
        //        queue.addOperation(bo2)
        
        //        let queue = OperationQueue()
        //        queue.addOperation {
        //            print(Thread.current, "bo1 add isFinish")
        //        }
        //        queue.addOperation {
        //            print(Thread.current, "bo2 add isFinish")
        //        }
        
        //        let queue = OperationQueue()
        ////        queue.maxConcurrentOperationCount = 1
        //        queue.addOperation {
        //            print(Thread.current, "bo1 add isFinish")
        //        }
        //        let op = BlockOperation {
        //            print(Thread.current, "bo2 add isFinish")
        //        }
        //        op.addExecutionBlock {
        //            print(Thread.current, "bo3 add isFinish")
        //        }
        //        queue.addOperation(op)
        
        
        //        let queue = OperationQueue()
        //        queue.maxConcurrentOperationCount = 3
        ////        queue.addOperation {
        ////            print(Thread.current, "bo1 add isFinish")
        ////        }
        //        let op = BlockOperation {
        //            print(Thread.current, "bo2 add isFinish")
        //        }
        //        op.addExecutionBlock {
        //            print(Thread.current, "bo3 add isFinish")
        //        }
        //
        //        let op1 = BlockOperation()
        //        op1.addExecutionBlock {
        //            print(Thread.current, "bo4 add isFinish")
        //        }
        //
        //        op.addDependency(op1)
        //        queue.addOperations([op, op1], waitUntilFinished: false) //线程通信
        
        //        let op1 = BlockOperation()
        //        let op2 = BlockOperation()
        //        let op3 = BlockOperation()
        //        let queue = OperationQueue()
        //        op1.addExecutionBlock {
        //            sleep(1)
        //            print(Thread.current, "bo1 add isFinish")
        //线程通信
        //            OperationQueue.main.addOperation {
        //                print(Thread.current,"refresh UI")
        //            }
        //        }
        //        op2.addExecutionBlock {
        //            sleep(1)
        //            print(Thread.current, "bo2 add isFinish")
        //
        //        }
        //        op3.addExecutionBlock {
        //            sleep(1)
        //            print(Thread.current, "bo3 add isFinish")
        //        }
        //        op1.queuePriority = .high
        //        op2.queuePriority = .low
        //        op3.queuePriority = .veryHigh
        //        queue.maxConcurrentOperationCount = 3
        //        queue.addOperations([op1, op2, op3], waitUntilFinished: false)
        
        //        let op3 = MunaulOperation()
        //        op3.name = "op3"
        //        op3.completionBlock = {
        //            print("op3 finished")
        //        }
        //
        //        let op4 = MunaulOperation()
        //        op4.name = "op4"
        //        op4.queuePriority = .veryHigh
        //        op4.completionBlock = {
        //            print("op4 finished")
        //        }
        // main
        //        op3.start()
        //        op4.start()
        // global
        //        DispatchQueue.global().async {
        //            op3.start()
        //        }
        //        DispatchQueue.global().async {
        //            op4.start()
        //        }
        
        // async concurrent
//                let op5 = ConcurrentOperation()
//                op5.name = "op5"
//                op5.completionBlock = {
//                    print("op5 finish")
//                }
//        
//                let op6 = ConcurrentOperation()
//                op6.name = "op6"
//                op6.completionBlock = {
//                    print("op6 finish")
//                }
//        
//                op5.start()
//                op6.start()
        
//        for _ in 1...13 {
//            saleTicket()
//        }
//        let temp: [Any] = [1, "Sttr", 2.3, ["a": 100]]
//        for obj in temp {
//            let a: Any = obj
//            print(a)
//        }
//        
//        let b: [AnyObject] = [A(), B()]
//        for obj in b {
//            let t: AnyObject = obj
//            print(t)
//        }
//        
        
//        as? as is   as? as! 向下转型 子类集成父类 多个子类数组遍历 is校验
//        Swift 为不确定类型提供了两种特殊的类型别名：
//
//        Any 可以表示任何类型，包括函数类型。
//        AnyObject 可以表示任何类类型的实例。
        
        // resultbuilder  创建一个结构体在命名前加 @resultbuilder 实现buildblock里的方法 然后调用的方法或者属性 在前边加xxxbuilder 里边传入 buildblock的参与就可以执行里边的方法
        // viewbuilder也同理 var body: view {}里只能加一个view 加入viewbuilder就可以加不同类型的view if else 添加不同的view
    }
    
//    class A {
//        
//    }
//    
//    class B {
//        
//    }
    
    func saleTicket() {
        Thread.sleep(forTimeInterval: 1)
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        let op = BlockOperation {
            saleSafe()
        }
        queue.addOperation(op)
    }
    
    func saleSafe() {
        objc_sync_enter(self)
        if LearningApp.ticketCount > 0 {
            LearningApp.ticketCount -= 1
            print("sale one ticket")
            print(Thread.current, "剩余：\(LearningApp.ticketCount)")
            Thread.sleep(forTimeInterval: 1)
        }
        objc_sync_exit(self)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.registerForRemoteNotifications()
        return true
    }


    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        self.sendDeviceTokenToServer(data: deviceToken)
    }

    // payload
//    {
//       "aps" : {
//          "alert" : {
//             "title" : "Game Request",
//             "subtitle" : "Five Card Draw",
//             "body" : "Bob wants to play poker"
//          },
//          "category" : "GAME_INVITATION"
//       },
//       "gameID" : "12345678"
//    }
    

    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError
                     error: Error) {
        // Try again later.
    }
}

protocol BaseResolving {
    func getData() -> Data
    func getLogin() -> Any
    func getFetcher() -> Fetching
}

protocol FeatureResolving {
    func getFeature() -> Bool
    func getExtraFeature() -> String
}

struct resolver: BaseResolving, FeatureResolving {
    func getFeature() -> Bool {
        true
    }
    
    func getExtraFeature() -> String {
        ""
    }
    
    func getFetcher() -> Fetching {
        let fetcher: Fetching = Fetcher()
        return fetcher
    }
    
    func getData() -> Data {
        Data()
    }
    
    func getLogin() -> Any {
        ""
    }
}

protocol Fetching {
    func getNormalData() -> URLResponse?
}

//pod
struct Fetcher: Fetching {
    func getNormalData() -> URLResponse? {
        return nil
    }
}

                    
                    
// BaseResolving -> Feature1Resolving -> Feature1Resolver: BaseResolving,Feature1Resolving -> 想使用Feature2的方法 -> Feature1Resolver:BaseResolving, Feature1Resolving, Feature2Resolving
//               -> Feature2Resolving: BaseResolving -> Feature2Resolver: BaseResolving, Feature2Resolving

class A {
    var t: B?
    init() {
        
    }
}

class B {
    var t: A?
    init() {
        
    }
}


protocol Parser {
    var string: String { get }
    associatedtype File
    func parse(with file: File)
}

protocol Aaa {
    var b: String { get set}
}

class Good {
    
    //    func temp(parser: any Parser) {}
    //    func temp<T: Parser>(parser: T) {}
    
    init() {
        //        let a: Int = temps(a: 1)
        //        print(a)
        //
        let b = temps(a: "str")
    }
    
    func temp(parser: some Parser) {}
    
    func temps<T: Equatable>(a: T) -> some Parser {
        let d = Bs(string: "")
        d.parse(with: "ssdadad")
        return d
    }
    
    func asss() -> Aaa {
        struct DD: Aaa {
            var b: String
        }
        let a: DD = .init(b: "")
        return a
    }
    
//    func temps<T: Equatable>(a: T) -> T {
//        return a
//    }
}

struct Bs: Parser {
    func parse(with file: String) {
        print(string + file)
    }
    
    typealias File = String
    
    var string: String
    
    
}
