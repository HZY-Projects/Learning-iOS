//
//  ContentView.swift
//  Learning
//
//  Created by  whatsup on 2024/10/26.
//

//Concurrency
//Perform asynchronous operations.
//Swift has built-in support for writing asynchronous and parallel code in a structured way. Asynchronous code can be suspended and resumed later, although only one piece of the program executes at a time. Suspending and resuming code in your program lets it continue to make progress on short-term operations like updating its UI while continuing to work on long-running operations like fetching data over the network or parsing files. Parallel code means multiple pieces of code run simultaneously — for example, a computer with a four-core processor can run four pieces of code at the same time, with each core carrying out one of the tasks. A program that uses parallel and asynchronous code carries out multiple operations at a time, and it suspends operations that are waiting for an external system.
//The additional scheduling flexibility from parallel or asynchronous code also comes with a cost of increased complexity. Swift lets you express your intent in a way that enables some compile-time checking — for example, you can use actors to safely access mutable state. However, adding concurrency to slow or buggy code isn’t a guarantee that it will become fast or correct. In fact, adding concurrency might even make your code harder to debug. However, using Swift’s language-level support for concurrency in code that needs to be concurrent means Swift can help you catch problems at compile time.
//The rest of this chapter uses the term concurrency to refer to this common combination of asynchronous and parallel code.
//Note
//If you’ve written concurrent code before, you might be used to working with threads. The concurrency model in Swift is built on top of threads, but you don’t interact with them directly. An asynchronous function in Swift can give up the thread that it’s running on, which lets another asynchronous function run on that thread while the first function is blocked. When an asynchronous function resumes, Swift doesn’t make any guarantee about which thread that function will run on.
//Although it’s possible to write concurrent code without using Swift’s language support, that code tends to be harder to read. For example, the following code downloads a list of photo names, downloads the first photo in that list, and shows that photo to the user:

/*
listPhotos(inGallery: "Summer Vacation") { photoNames in
    let sortedNames = photoNames.sorted()
    let name = sortedNames[0]
    downloadPhoto(named: name) { photo in
        show(photo)
    }
}
 */

//Even in this simple case, because the code has to be written as a series of completion handlers, you end up writing nested closures. In this style, more complex code with deep nesting can quickly become unwieldy.
//Defining and Calling Asynchronous Functions
//An asynchronous function or asynchronous method is a special kind of function or method that can be suspended while it’s partway through execution. This is in contrast to ordinary, synchronous functions and methods, which either run to completion, throw an error, or never return. An asynchronous function or method still does one of those three things, but it can also pause in the middle when it’s waiting for something. Inside the body of an asynchronous function or method, you mark each of these places where execution can be suspended.
//To indicate that a function or method is asynchronous, you write the async keyword in its declaration after its parameters, similar to how you use throws to mark a throwing function. If the function or method returns a value, you write async before the return arrow (->). For example, here’s how you might fetch the names of photos in a gallery:

/*
func listPhotos(inGallery name: String) async -> [String] {
    let result = // ... some asynchronous networking code ...
    return result
}
 */

//For a function or method that’s both asynchronous and throwing, you write async before throws.
//When calling an asynchronous method, execution suspends until that method returns. You write await in front of the call to mark the possible suspension point. This is like writing try when calling a throwing function, to mark the possible change to the program’s flow if there’s an error. Inside an asynchronous method, the flow of execution is suspended only when you call another asynchronous method — suspension is never implicit or preemptive — which means every possible suspension point is marked with await. Marking all of the possible suspension points in your code helps make concurrent code easier to read and understand.
//For example, the code below fetches the names of all the pictures in a gallery and then shows the first picture:

/*
let photoNames = await listPhotos(inGallery: "Summer Vacation")
let sortedNames = photoNames.sorted()
let name = sortedNames[0]
let photo = await downloadPhoto(named: name)
show(photo)
*/

//Because the listPhotos(inGallery:) and downloadPhoto(named:) functions both need to make network requests, they could take a relatively long time to complete. Making them both asynchronous by writing async before the return arrow lets the rest of the app’s code keep running while this code waits for the picture to be ready.
//To understand the concurrent nature of the example above, here’s one possible order of execution:
//The code starts running from the first line and runs up to the first await. It calls the listPhotos(inGallery:) function and suspends execution while it waits for that function to return.
//While this code’s execution is suspended, some other concurrent code in the same program runs. For example, maybe a long-running background task continues updating a list of new photo galleries. That code also runs until the next suspension point, marked by await, or until it completes.
//After listPhotos(inGallery:) returns, this code continues execution starting at that point. It assigns the value that was returned to photoNames.
//The lines that define sortedNames and name are regular, synchronous code. Because nothing is marked await on these lines, there aren’t any possible suspension points.
//The next await marks the call to the downloadPhoto(named:) function. This code pauses execution again until that function returns, giving other concurrent code an opportunity to run.
//After downloadPhoto(named:) returns, its return value is assigned to photo and then passed as an argument when calling show(_:).
import SwiftUI
import UIKit
import Charts

struct ToyShape: Identifiable {
    var type: String
    var count: Double
    var id = UUID()
}

struct ContentView: View {
    var data: [ToyShape] = [
        .init(type: "Cube", count: 5),
        .init(type: "Sphere", count: 4),
        .init(type: "Pyramid", count: 4)
    ]
    @StateObject var vm: ContentVM
    let avs = RunLoops()
    @StateObject var gcd: GCD
    init() {
        _vm = StateObject(wrappedValue: ContentVM())
        _gcd = StateObject(wrappedValue: GCD())
    }
    
    var body: some View {
        VStack {
//            TempView()
            Chart {
                BarMark(
                    x: .value("Shape Type", data[0].type),
                    y: .value("Total Count", data[0].count)
                )
                BarMark(
                     x: .value("Shape Type", data[1].type),
                     y: .value("Total Count", data[1].count)
                )
                BarMark(
                     x: .value("Shape Type", data[2].type),
                     y: .value("Total Count", data[2].count)
                )
            }
            Button {
                gcd.initTimer()
            } label: {
                Text("init Timer")
            }
            Button {
                gcd.startTimer()
            } label: {
                Text("start Timer")
            }
            Button {
                gcd.stopTimer()
            } label: {
                Text("stop Timer")
            }
            
            Button {
                avs.stop()
            } label: {
                Text("stop Button")
            }
        }
        .padding()
        Button {
            // leaks
//            var a: A?
//            a = A()
//            var b: B?
//            b = B()
//            a!.t = b
//            b!.t = a
//            a = nil
//            b = nil
            
            // 内存泄漏（内存地址不释放）  野指针 （内存地址释放又被访问）  内存争抢 同时访问读写同一块地址
            // product scheme -   zoobie 访问野指针 访问了已经释放的内存地址
            //                -   Address / Theard sanitizer 同时争抢一块内存地址
            // instrument  leaks -  内存泄漏 内存地址没有得到释放
//            vm.addressScan(a: &vm.temp)
            avs.clickOne()
        } label: {
            Text("Done Button")
        }

    }
}



