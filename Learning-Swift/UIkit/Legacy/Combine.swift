//
//  Combine.swift
//  Learning
//
//  Created by  whatsup on 2024/10/27.
//

import Foundation
import Combine

class Combine: ObservableObject {
    
    @Published var changeText: String? = ""
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        let temp = Just(1).map { _ in 0 }
        
        let _ = $changeText
            .map { "\(String(describing: $0)) _" }
            .compactMap{ $0 }
            .filter { $0.contains("_") }
            .debounce(for: 0.1, scheduler: RunLoop.main)
            .receive(on: DispatchQueue.main)
            .sink { result in
                print(result)
            } receiveValue: { _ in
                
            }.store(in: &cancellable)
        
//        merge combineLatest zip
        
        let feature = Future<String, Never> { promise in
            DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 3) {
                promise(.success("success"))
            }
        }
        
        feature.sink { completation in
            print(completation)
        } receiveValue: { result in
            print(result)
        }.store(in: &cancellable)
        
    }
}

