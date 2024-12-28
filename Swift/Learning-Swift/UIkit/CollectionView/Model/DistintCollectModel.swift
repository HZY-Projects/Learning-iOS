//
//  DistintCollectModel.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/7.
//

import Foundation

struct DistintCollectModel: Hashable, Identifiable {
    
    let id: UUID = .init()
    let image: String
    
    init(image: String) {
        self.image = image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: DistintCollectModel, rhs: DistintCollectModel) -> Bool {
        return lhs.id == rhs.id
    }
}
