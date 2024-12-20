//
//  TableViewModel.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/16.
//

import Foundation
import UIKit
import UniformTypeIdentifiers

struct TableViewModel {
    let header: String
    var subItems: [TableViewSubModel]
}

struct TableViewSubModel {
    var title: String
    var url: URL
    var image: UIImage = .init(systemName: "rectangle")!
}
