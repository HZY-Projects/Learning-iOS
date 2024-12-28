//
//  GridCollectionModel.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/3.
//

import Foundation

struct GridCollectionModel: Identifiable, Hashable {
   
    var id: UUID = .init()
    
    var image: String
    var title: String
    var des: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: GridCollectionModel, rhs: GridCollectionModel) -> Bool {
        return lhs.id == rhs.id
    }
}
