//
//  HomeDetailModel.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/3.
//

import Foundation

class CollectDetailModel: Identifiable, Hashable {
    
    let title: String
    let image: String
    let des: String
    let subItems: [CollectDetailModel]
    let controllerType: ControllerType?
    
    init(title: String, image: String, des: String, subItems: [CollectDetailModel] = [], controllerType: ControllerType? = nil) {
        self.title = title
        self.image = image
        self.des = des
        self.subItems = subItems
        self.controllerType = controllerType
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: CollectDetailModel, rhs: CollectDetailModel) -> Bool {
        return lhs.id == rhs.id
    }
}

struct HomeDetailSubModel {
    let name: String
    let type: ControllerType
}
