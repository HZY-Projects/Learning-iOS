//
//  RunLoops.swift
//  Learning
//
//  Created by  whatsup on 2024/11/20.
//

import Foundation

class RunLoops: NSObject {
    
    var thread: Thread
//    线程刚创建时并没有RunLoop对象，RunLoop会在第一次获取它时创建。4个自动获取的函数：CFRunLoopGetMain()、[NSrunLoop mainRunLoop] 和 CFRunLoopGetCurrent()、[NSrunLoop currentRunLoop] 。
    static var isStop: Bool = false
 
    override init() {
//        let queue = OperationQueue()
//        let ops = Operation()
//        ops.completionBlock = { [weak self] in
//            print(Thread.current)
//            self?.thread = Thread.current
//            
//            let ob = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, CFRunLoopActivity.allActivities.rawValue, true, 0) { observe, activity in
//                print(observe ?? "")
//                switch activity {
//                case CFRunLoopActivity.entry:
//                    print("进入runloop")
//                case CFRunLoopActivity.beforeTimers:
//                    print("即将处理timer")
//                case CFRunLoopActivity.beforeSources:
//                    print("即将处理sources")
//                case CFRunLoopActivity.beforeWaiting:
//                    print("休眠")
//                case CFRunLoopActivity.afterWaiting:
//                    print("唤醒")
//                case CFRunLoopActivity.exit:
//                    print("退出")
//                default:
//                    break
//                }
//            }
//            
//            CFRunLoopAddObserver(CFRunLoopGetCurrent(), ob, CFRunLoopMode.defaultMode)
//            
//            RunLoop.current.add(Port(), forMode: .default)
////            RunLoop.current.acceptInput(forMode: .default, before: RunLoop.current.limitDate(forMode: .default) ?? Date())
////            RunLoop.current.run()
//            RunLoop.current.run(mode: .default, before: Date.distantFuture)
//        }
//        queue.addOperation(ops)
//        let isStop: Bool = false
        thread = Thread {
            print("-------------------------------------")
//            print(Thread.current)
            let ob = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, CFRunLoopActivity.allActivities.rawValue, true, 0) { observe, activity in
                switch activity {
                case CFRunLoopActivity.entry:
                    print("进入")
                case CFRunLoopActivity.beforeTimers:
                    print("beforeTimers")
                case CFRunLoopActivity.beforeSources:
                    print("beforeSources")
                case CFRunLoopActivity.beforeWaiting:
                    print("睡眠")
                case CFRunLoopActivity.afterWaiting:
                    print("唤醒")
                case CFRunLoopActivity.exit:
                    print("退出")
                default:
                    break
                }
            }
            
            CFRunLoopAddObserver(CFRunLoopGetCurrent(), ob, CFRunLoopMode.commonModes)
        
            RunLoop.current.add(Port(), forMode: .default)
//            RunLoop.current.run()
            while !RunLoops.isStop {
//                RunLoop.current.run(mode: .default, before: Date.distantFuture)
                RunLoop.current.acceptInput(forMode: .default, before: Date.distantFuture)
            }
            print("not loop")
        }
//        thread.start()
        super.init()
    }
    
    func clickOne() {
        perform(#selector(dosomething), on: thread, with: self, waitUntilDone: false)
    }
    
    func stop() {
        RunLoops.isStop = true
        CFRunLoopStop(CFRunLoopGetCurrent())
    }
    
    @objc func dosomething(){
        print(Thread.current)
//        print(RunLoop.current.currentMode ?? "")
    }
 
}
