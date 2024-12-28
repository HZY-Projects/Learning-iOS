//
//  GCD.swift
//  Learning
//
//  Created by  whatsup on 2024/10/27.
//

import Foundation

class GCD: ObservableObject {
    
    var infiQueue: DispatchQueue?
    
    var timer: DispatchSourceTimer?
    
    var isSusspended: Bool = true
    
    func queueMethod() {
        let iQueue = DispatchQueue(label: "com.xxx.xxx", qos: .default, attributes: [.initiallyInactive, .concurrent])
        infiQueue = iQueue
        iQueue.async {
            print(Thread.current)
        }
    }
    
    init() {
        print("------------------------ Start Grand Central Dispatch ------------------------")
        //        queueMethod()
        //        if let q = infiQueue {
        //            //  必须执行 要不就crash
        //            q.activate()
        //        }
        //        DispatchQueue.main.async {
        //            print(Thread.current)
        //        }
        // 死锁
        //        DispatchQueue.main.sync {
        //            print(Thread.current)
        //        }
        // qos = quality of service
        //        DispatchQueue.global(qos: .userInteractive).async {
        //            // 最高优先级
        //            print("userInteractive -- ", Thread.current)
        //        }
        //        DispatchQueue.global(qos: .background).async {
        //            // 最低优先级
        //            print("background -- ", Thread.current)
        //        }
        //        DispatchQueue.global(qos: .default).async {
        //            // 第三高优先级
        //            print("default -- ", Thread.current)
        //        }
        //        DispatchQueue.global(qos: .utility).async {
        //            // 第四高优先级
        //            print("utility -- ", Thread.current)
        //        }
        //        DispatchQueue.global(qos: .userInitiated).async {
        //            // 第二高优先级
        //            print("userInitiated -- ", Thread.current)
        //        }
        //
        //        DispatchQueue.global(qos: .unspecified).async {
        //            // 没有指定
        //            print("unspecified -- ", Thread.current)
        //        }
        
        //        DispatchQueue(label: "com.xxx.xxx", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit).async {
        //            print(Thread.current)
        //        }
        //        let serialQueue = DispatchQueue(label: "com.serial.queue")
        //        for i in 1...10 {
        //            serialQueue.async {
        //                self.excuteTask(i: i)
        //            }
        //        }
        //        let iQueue = DispatchQueue(label: "com.xxx.xxx", qos: .default, attributes: .initiallyInactive)
        //        infiQueue = iQueue
        //        iQueue.async {
        //            print(Thread.current)
        //        }
        
        
        //        let concurrentQueue = DispatchQueue(label: "com.concurrent.queue", attributes: .concurrent)
        //        for i in 1...10 {
        //            concurrentQueue.async {
        //                self.excuteTask(i: i)
        //            }
        //        }
        
        //        let group = DispatchGroup()
        //        for i in 1...10 {
        //            print("执行任务 \(i)")
        //            concurrentQueue.async(group: group) {
        //                self.excuteTask(i: i)
        //            }
        //        }
        //        group.notify(queue: DispatchQueue.main) {
        //            print("refresh UI")
        //        }
        
        //        let att = DispatchQueue.Attributes()
        //        let att = DispatchQueue.Attributes(arrayLiteral: [.concurrent])
        //        let att = DispatchQueue.Attributes(rawValue: 1)
        //        att.rawValue
        
        //        let que1 = DispatchQueue(label: "xx", attributes: att)
        //        que1.async {
        //            print(Thread.current)
        //        }
        
        // 继承队列的默认的
        //        let queues = DispatchQueue(label: "xx", autoreleaseFrequency: .inherit)
        // 并发队列默认的
        //        let queues = DispatchQueue(label: "xx", autoreleaseFrequency: .never)
        // 给任务单独的自动释放池
        //        let queues = DispatchQueue(label: "xx", autoreleaseFrequency: .workItem)
        
        //        let q = DispatchSerialQueue(label: "asda", qos: .default)
        //        let q = DispatchConcurrentQueue(label: "", qos: .background, autoreleaseFrequency: .never, target: nil)
        //        let q = DispatchQueue.main // 死锁
        //        let t = Thread {
        //            let q = DispatchQueue.global()
        //            for i in 1...10 {
        //            q.async {
        //                print(i, Thread.current)
        //            }
        //                q.sync {
        //                    print(i, Thread.current)
        //                }
        //            }
        //        }
        //        t.start()
        
        //        let qo = DispatchQueue(label: "", attributes: .concurrent)
        //        let workitem = DispatchWorkItem {
        //            print(Thread.current)
        //        }
        
        //        DispatchWorkItemFlags  跟qos一样的优先级  barrier变成阻塞
        //        for i in 1...10 {
        //            let workitem = DispatchWorkItem(qos: .default, flags: i == 3 ? .barrier : .assignCurrentContext) {
        //                print(i, Thread.current)
        //            }
        //
        //            qo.async(execute: workitem)
        //        }
        //        let workitem = DispatchWorkItem(qos: .default, flags: .assignCurrentContext) {
        //            print(1, Thread.current)
        //        }
        //        let workitem1 = DispatchWorkItem(qos: .default, flags: .enforceQoS) {
        //            print(2, Thread.current)
        //        }
        //        workitem1.notify(queue: qo, execute: workitem)
        //        qo.async(execute: workitem1)
        //        workitem.cancel()
        //        workitem.wait()
        // DispatchWallTime microsecond precision
        //  nanosecond precision
        //        let result = workitem.wait(timeout: DispatchTime.now() + 3)
        //        print(result)
        
        //        qo.async(execute: workitem)
        //        qo.asyncAfter(deadline: .now() + 6, execute: workitem)
        //        qo.asyncAfter(deadline: .now(), qos: .default, flags: .assignCurrentContext) {
        //            print(Thread.current)
        //        }
        //        qo.asyncAfter(wallDeadline: .now(), execute: workitem)
        //        qo.sync(execute: workitem)
        //        qo.sync {  print(Thread.current) }
        //        qo.asyncAndWait {
        //            print(Thread.current)
        //        }
        //        qo.asyncAndWait(execute: workitem)
        
        //        let group = DispatchGroup()
        //        let queue = DispatchQueue(label: "com.queue.xxx", attributes: .concurrent, autoreleaseFrequency: .inherit)
        //        for i in 1...10 {
        //            queue.async(group: group, qos: .default, flags: .inheritQoS) {
        //                print(i, Thread.current)
        //                DispatchQueue.global().async {
        //                    sleep(2)
        //                    print("aaaaa")
        //                }
        //            }
        //        }
        //        group.notify(qos: .default, flags: .inheritQoS, queue: DispatchQueue.main) {
        //            print("finish this work", Thread.current)
        //        }
        
        //        let group = DispatchGroup()
        //        let queue = DispatchQueue(label: "com.queue.xxx", attributes: .concurrent, autoreleaseFrequency: .inherit)
        //        for i in 1...10 {
        //            group.enter()
        //            queue.async(group: group, qos: .default, flags: .inheritQoS) {
        //                print(i, Thread.current)
        //                DispatchQueue.global().async {
        //                    sleep(2)
        //                    print("aaaaa")
        //                    group.leave()
        //                }
        //            }
        //        }
        //        group.notify(qos: .default, flags: .inheritQoS, queue: DispatchQueue.main) {
        //            print("finish this work", Thread.current)
        //        }
        
        //        let group = DispatchGroup()
        //        let queue = DispatchQueue(label: "", attributes: .concurrent)
        //        let work1 = DispatchWorkItem {
        //            sleep(3)
        //            print("work1", Thread.current)
        //        }
        //        let work2 = DispatchWorkItem {
        //            print("work2", Thread.current)
        //            group.enter()
        //            DispatchQueue.global().async {
        //                sleep(2)
        //                print("work2-2", Thread.current)
        //                group.leave()
        //            }
        //        }
        //        let work3 = DispatchWorkItem {
        //            print("work3", Thread.current)
        //        }
        //        queue.async(group: group, execute: work1)
        //        group.wait()
        //        print("ready two")
        //        queue.async(group: group, execute: work2)
        //        queue.async(group: group, execute: work3)
        //        group.notify(queue: DispatchQueue.main) {
        //            print("last one")
        //        }
        
        //        let workLoop = DispatchWorkloop(label: "", autoreleaseFrequency: .inherit)
        //        DispatchQueue(label: "", target: workLoop).async {
        //
        //        }
        //        DispatchQueue.concurrentPerform(iterations: 10) { i in
        //            print(i, Thread.current)
        //        }
        
        // DispatchQueue DispatchWorkItem DispatchGroup DispatchQos DispatchTime
        
        // ---------------------------------------------------------------------
    
//        let path = NSHomeDirectory() + "/Documents/myData.text";
//        print(path)
        
       

        let semaphore = DispatchSemaphore(value: 3)
        let queue = DispatchQueue.global(qos: .background)
        for i in 1...10 {
            queue.async {
                semaphore.wait()
                print("implement \(i)")
                sleep(2)
                print("finish \(i)")
                semaphore.signal()
            }
        }
        
        
        print("------------------------ End Grand Central Dispatch ------------------------")
        
        //        // 串行队列
        //        let queue1 = DispatchQueue(label: "first queue")
        //        // 同步执行
        //        queue1.sync {
        //            for i in 1...3 {
        //                print(i)
        //            }
        //        }
        //
        //        // 主队列串行
        //        let queue2 = DispatchQueue.main
        //        queue2.sync {
        //            // 死锁 互等
        //            print("error")
        //        }
        //
        //        // 异步执行嵌套同步执行 - 串行队列
        //        // 串行队列在执行任务的时候 不允许有同步阻塞
        //        let queue3 = DispatchQueue(label: "second queue")
        //        queue3.async {
        //            print("test")
        //            queue3.sync {
        //                print("error")
        //            }
        //        }
        //
        //        let queue4 = DispatchQueue.global()
        //        queue4.async {
        //            for i in 1...3 {
        //                print(i)
        //            }
        //            queue4.sync {
        //                print(4)
        //            }
        //        }
        //
        //        let queue5 = DispatchQueue(label: "", attributes: [.concurrent])
        //        queue5.sync {
        //            for i in 1...3 {
        //                print(i)
        //            }
        //            print(Thread.current)
        //            queue5.async {
        //                print(Thread.current)
        //            }
        //        }
        //
        //        let queue6 = DispatchQueue(label: "barrier", attributes: .concurrent)
        //        let task = DispatchWorkItem(qos: DispatchQoS.default, flags: DispatchWorkItemFlags.barrier) {}
        //        queue6.async {
        //            print(Thread.current)
        //            queue6.async {
        //                print(11111)
        //                print(Thread.current)
        //            }
        //            queue6.async {
        //                print(2222)
        //                print(Thread.current)
        //            }
        //            queue6.async(execute: task)
        //            queue6.async {
        //                print(3333)
        //                print(Thread.current)
        //            }
        //            queue6.async {
        //                print(4444)
        //                print(Thread.current)
        //            }
        //        }
        
        //        let queueGroup = DispatchGroup()
        //        let queue = DispatchQueue.global()
        //        queue.async(group: queueGroup, execute: DispatchWorkItem(block: {
        //            print(Thread.current)
        //        }))
        //        queue.async(group: queueGroup, execute: DispatchWorkItem(block: {
        //            print(Thread.current)
        //        }))
        //        queueGroup.notify(queue: .main) {
        //            print(Thread.current)
        //        }
        
        //        let queueGroup = DispatchGroup()
        //        let queue = DispatchQueue.global()
        //        queueGroup.enter()
        //        queue.async {
        //            print(Thread.current)
        //            queueGroup.leave()
        //        }
        //        queueGroup.enter()
        //        queue.async {
        //            print(Thread.current)
        //            queueGroup.leave()
        //        }
        //        queueGroup.notify(queue: .main) {
        //            print(Thread.current)
        //        }
        
        //        let queueGroup = DispatchGroup()
        //        let queue = DispatchQueue.global()
        //        queueGroup.enter()
        //        queue.async {
        //            print(Thread.current)
        //            queueGroup.leave()
        //        }
        //        queueGroup.enter()
        //        queue.async {
        //            print(Thread.current)
        //            queueGroup.leave()
        //        }
        //        queueGroup.wait()
        //        print(11111)
        
        //        let queue = DispatchQueue(label: "", attributes: .concurrent)
        //        let semaphore = DispatchSemaphore(value: 1)
        //        queue.async {
        //            semaphore.wait()
        //            sleep(3)
        //            print(1111111)
        //            semaphore.signal()
        //        }
        //        queue.async {
        //            semaphore.wait()
        //            print(2222222)
        //            semaphore.signal()
        //        }
        //        queue.async {
        //            semaphore.wait()
        //            print(3333333)
        //            semaphore.signal()
        //        }
    }
    
    func initTimer() {
        // 局部变量不执行 没有被持有
        timer = DispatchSource.makeTimerSource()
        timer?.setEventHandler {
            print("xxxxxx")
        }
        // leeway 富裕 never不允许误差
        timer?.schedule(deadline: DispatchTime.now(), repeating: 1)

    }
    
    func startTimer() {
        if isSusspended {
            timer?.resume()
        }
        isSusspended = false
    }

    func stopTimer() {
        if isSusspended {
            return
        }
        timer?.suspend()
        isSusspended = true
    }
    
    func releaseTimer() {
        if isSusspended {
            timer?.resume()
        }
        timer?.cancel()
    }
    
    deinit {
        releaseTimer()
    }
    
    func excuteTask(i: Int) {
        print("\(i) \(Thread.current)")
    }
}
