//
//  Learning.swift
//  Learning
//
//  Created by  whatsup on 2024/10/26.
//

import Foundation

// Concurrency
// await async

struct Model: Codable {
    var id: String
}

// safety 并发安全 actor
actor Concurrency: ObservableObject {
    
    init() {
        // 异步并发
        // Calling Asynchronous Functions in Parallel
        Task {
            async let _ = testFuncWithNoReturnValue()
            async let tempA = testFunc()
            async let tempB = testFuncWithThrow()
            do {
                let result = try await [tempA, tempB]
                print(result)
            } catch {
                print("log error")
            }
            
            do {
                guard let url = URL(string: "https://www.baidu.com") else {
                    return
                }
                let (data, _) = try await URLSession.shared.data(from: url)
                if let models = try? JSONDecoder().decode(Model.self, from: data) {
                    print(models)
                }
            } catch {
                
            }
        }
        
        // 异步串行
        // Asynchronous Sequences
        Task {
            do {
                let a = try await testFunc()
                let b = await testFuncWithThrow()
                print(a, b)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    // 任务组
    // Task group
    func testFuncGroup() async {
        let _ = await withTaskGroup(of: String.self) { group in
            do {
                let photoNames = try await testFunc()
                for _ in photoNames {
                    group.addTask {
                        await self.testFuncWithThrow()
                    }
                }
            } catch {
                
            }
            
            var results: [String] = []
            for await photo in group {
                results.append(photo)
            }
            return results
        }
    }
    
    // 任务组 取消任务
    // Task group Cancellation
    func testFuncGroupCancel() async {
        _ = await withTaskGroup(of: Optional<String>.self) { group in
            let photoNames = await testFuncWithGroupSubCancel()
            for _ in photoNames {
                let added = group.addTaskUnlessCancelled {
                    guard !Task.isCancelled else { return nil }
                    return await self.testFuncWithGroupSub()
                }
                guard added else { break }
            }

            var results: [String] = []
            for await photo in group {
                if let photo { results.append(photo) }
            }
            return results
        }
    }
    
    func testFuncWithGroupSubCancel() async -> [String] {
        return []
    }
    
    func testFuncWithGroupSub() async -> String? {
        return ""
    }
    
    func testFuncWithNoReturnValue() async throws {
        
    }
    
    func testFunc() async throws -> [String] {
        do {
            await Task.yield() // 停止
            try await Task.sleep(nanoseconds: 1) // 睡眠1
            return await [testFuncWithThrow()]
        } catch let error {
            throw error
        }
    }
    
    func testFuncWithThrow() async -> String {
        return ""
    }
    
    func testFuncWithForin() async throws {
        let handle = FileHandle.standardInput
        for try await line in handle.bytes.lines {
            print(line)
        }
    }
}
