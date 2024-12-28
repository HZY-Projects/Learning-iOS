//
//  GridCollectViewModel.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/4.
//

import Foundation
import UIKit

class GridCollectViewModel: NSObject {
    var dataSource: UICollectionViewDiffableDataSource<GridSection, GridCollectionModel>!
    var data: [String: [String]]?
    var snapshot = NSDiffableDataSourceSnapshot<GridSection, GridCollectionModel>()
    var secSnapshot = NSDiffableDataSourceSectionSnapshot<GridCollectionModel>()
    
    typealias ItemSelectBlock = (IndexPath) -> Void
    let didselectBlock: ItemSelectBlock
    
    init(didselectBlock: @escaping ItemSelectBlock) {
        self.didselectBlock = didselectBlock
        super.init()
    }
    
    convenience init(block: @escaping ItemSelectBlock) {
        self.init(didselectBlock: block)
    }
    
    func refreshData(paramter: [String: [String]]? = nil) {
        if let paramter = paramter {
            data = paramter
        } else {
            data = [GridSection.feature.rawValue: ["patagonia",
                                                   "paris",
                                                   "cambodia",
                                                   "st-lucia",
                                                   "vietnam"],
                    GridSection.type.rawValue: ["new-zealand",
                                                "iceland",
                                                "italy",
                                                "cusco"]]
        }
        snapshot.deleteAllItems()
        snapshot.deleteSections([.feature, .type])

        snapshot.appendSections([.feature, .type])
        var features = [GridCollectionModel]()
        let featureArray = data?[GridSection.feature.rawValue] ?? []
        let typeArray = data?[GridSection.type.rawValue] ?? []
        for item in featureArray {
            let model = GridCollectionModel(image: "\(item).jpg", title: item, des: "This is beautiful area.")
            features.append(model)
        }
        let types = typeArray.map {
            GridCollectionModel(image: "\($0).jpg", title: $0, des: "It is also a beautiful area!")
        }
        snapshot.appendItems(features, toSection: .feature)
        snapshot.appendItems(types, toSection: .type)
        dataSource.apply(snapshot)
    }
    
    func addItem() {
        if snapshot.itemIdentifiers.contains(where: { $0.title == "italysss" }) {
            return
        }
        let newItem = [GridCollectionModel(image: "italy.jpg", title: "italysss", des: "It is also a beautiful!")]
        snapshot.appendItems(newItem, toSection: .type)
        dataSource.apply(snapshot)
    }
    
    func resetSection() {
//        secSnapshot.deleteAll()
        secSnapshot.delete(secSnapshot.items)
        let newItem = [GridCollectionModel(image: "italy.jpg", title: "resetSection1", des: "It is also a beautiful!"), GridCollectionModel(image: "italy.jpg", title: "resetSection2", des: "It is also a beautiful!")]
        secSnapshot.append(newItem)
        dataSource.apply(secSnapshot, to: .feature)
    }
    
    func insertSection() {
        if secSnapshot.items.count < 1 {
            resetSection()
        } 
        let temp = secSnapshot.items.filter{ $0.title == "resetSection3" }
        secSnapshot.delete(temp)
        secSnapshot.insert([GridCollectionModel(image: "italy.jpg", title: "resetSection3", des: "It is also a beautiful!")], after: secSnapshot.items[0])
                            
        dataSource.apply(secSnapshot, to: .feature)
    }
    
    func moveItem() {
        let moveItem: [GridCollectionModel] = snapshot.itemIdentifiers.filter { $0.title == "italysss" }
        let oldItem: [GridCollectionModel] = snapshot.itemIdentifiers.filter { $0.title == "iceland" }
        if let moveModel = moveItem.first, let oldModel = oldItem.first {
            snapshot.moveItem(moveModel, afterItem: oldModel)
        }
        dataSource.apply(snapshot)
//        if let sectionIndex = snapshot.indexOfSection(.feature) {
//            let sectionIdentifier = snapshot.sectionIdentifiers[sectionIndex]
//            snapshot.moveSection(sectionIdentifier, afterSection: .type)
//        }
        
            
//        animate
//        Resets the UI to reflect the state of the data in the snapshot without computing a diff or animating the changes.
//        dataSource.applySnapshotUsingReloadData(snapshot)
    }
}

extension GridCollectViewModel: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        didselectBlock(indexPath)
    }
}

extension GridCollectViewModel: UICollectionViewDragDelegate, UICollectionViewDropDelegate {
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: any UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        
        let data = data?[indexPath.section == 0 ? GridSection.feature.rawValue: GridSection.type.rawValue]
        let name = data?[indexPath.row] ?? ""
        let image = UIImage(named: name + ".jpg")!
        let dragItem = UIDragItem(itemProvider: NSItemProvider(object: image))
        dragItem.localObject = image
        return [dragItem]
    }
    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        if session.localDragSession != nil {
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        } else {
            return UICollectionViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        let destinationIndexPath = coordinator.destinationIndexPath ?? IndexPath(item: 0, section: 0)
        switch coordinator.proposal.operation {
           case .move:
               let items = coordinator.items
               if items.contains(where: { $0.sourceIndexPath != nil }) {
                   if items.count == 1, let item = items.first {
                       
                       var dataArr = data?[item.sourceIndexPath?.section == 0 ? GridSection.feature.rawValue: GridSection.type.rawValue]
                       
                       if let row = item.sourceIndexPath?.row {
                           let temp = dataArr?[row]
                           dataArr?.remove(at: row)
                           if let temp {
                               dataArr?.insert(temp, at: destinationIndexPath.row)
                           }
                       }
                       data?[item.sourceIndexPath?.section == 0 ? GridSection.feature.rawValue: GridSection.type.rawValue] = dataArr
                       
                       let model = snapshot.itemIdentifiers(inSection: item.sourceIndexPath?.section == 0 ? .feature: .type)[item.sourceIndexPath?.row ?? 0]
                       if item.sourceIndexPath?.row == destinationIndexPath.row {
                           return
                       }
                       snapshot.moveItem(model, beforeItem: snapshot.itemIdentifiers(inSection: item.sourceIndexPath?.section == 0 ? .feature: .type)[destinationIndexPath.row])
                       dataSource.apply(snapshot, animatingDifferences: false)
                       
                       // collectionViewDatasource use
//                       collectionView.performBatchUpdates({
//                           collectionView.deleteItems(at: [item.sourceIndexPath!])
//                           collectionView.insertItems(at: [destinationIndexPath])
//                       })
//                       coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
                   }
               }
           default:
               return
           }
       }
}
