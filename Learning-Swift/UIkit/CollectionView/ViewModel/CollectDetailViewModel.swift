//
//  HomeDetailViewModel.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/3.
//

import Foundation
import UIKit

enum Section {
    case button
}

class CollectDetailViewModel {
    
    var dataSource: UICollectionViewDiffableDataSource<Section, CollectDetailModel>?
    
    func updateData() {
        var buttonSubItems = [CollectDetailModel]()
        let subArray = [
            HomeDetailSubModel(name: "Grid Collection View", type: .gridCollection),
            HomeDetailSubModel(name: "Distint Collection View", type: .distintCollection),
            HomeDetailSubModel(name: "Apple Videos Collection View", type: .videosCollection)
        ]
        for item in subArray {
            buttonSubItems.append(CollectDetailModel(title: item.name, image: "", des: "--", controllerType: item.type))
        }
        var button = [CollectDetailModel(title: "Collection", image: "list.dash.header.rectangle", des: "collection view describtion.", subItems: buttonSubItems)]
        
        var snapshots = NSDiffableDataSourceSectionSnapshot<CollectDetailModel>()
        for _ in 1...6 {
            button.append(CollectDetailModel(title: "title", image: "square.and.arrow.up", des: "this is collectionView list"))
        }
        
        snapshots.append(button)
        for item in button where !item.subItems.isEmpty {
            snapshots.append(item.subItems, to: item)
        }
        dataSource?.apply(snapshots, to: .button, animatingDifferences: false)
    }
}
