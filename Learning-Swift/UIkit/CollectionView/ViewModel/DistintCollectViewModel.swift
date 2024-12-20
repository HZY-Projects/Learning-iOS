//
//  DistintCollectViewModel.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/7.
//

import UIKit

class DistintCollectViewModel: NSObject, UICollectionViewDelegate {
    
    var datasource: UICollectionViewDiffableDataSource<SectionKind, DistintCollectModel>? = nil
    
    func registerCell(collectionView: UICollectionView) {
        
        collectionView.register(DistintCollectListCell.self, forCellWithReuseIdentifier: DistintCollectListCell.cellIdentifier)
        collectionView.register(DistintCollectGridCell.self, forCellWithReuseIdentifier: DistintCollectGridCell.cellIdentifier)
        collectionView.register(DistintCollectHoriCell.self, forCellWithReuseIdentifier: DistintCollectHoriCell.cellIdentifier)
        
        datasource = UICollectionViewDiffableDataSource<SectionKind, DistintCollectModel>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            let kind = SectionKind(rawValue: indexPath.section)
            switch kind {
            case .list:
                let cell: DistintCollectListCell = collectionView.dequeueReusableCell(withReuseIdentifier: DistintCollectListCell.cellIdentifier, for: indexPath) as! DistintCollectListCell
                cell.imageView.image = .init(systemName: itemIdentifier.image)
                cell.titleLab.text = itemIdentifier.image
                cell.subTitleLab.text = "--"
                return cell
            case .horizontal:
                let cell: DistintCollectHoriCell = collectionView.dequeueReusableCell(withReuseIdentifier: DistintCollectHoriCell.cellIdentifier, for: indexPath) as! DistintCollectHoriCell
                cell.imageView.image = .init(named: "\(itemIdentifier.image).jpg")
                cell.titleLab.text = itemIdentifier.image
                return cell
            default:
                let cell: DistintCollectGridCell = collectionView.dequeueReusableCell(withReuseIdentifier: DistintCollectGridCell.cellIdentifier, for: indexPath) as! DistintCollectGridCell
                cell.imageView.image = .init(named: "\(itemIdentifier.image).jpg")
                cell.titleLab.text = itemIdentifier.image
                cell.subTitleLab.text = "distint second"
                return cell
            }
        })
        
        let header = UICollectionView.SupplementaryRegistration<GridCollectHeaderView>(elementKind: GridCollectionView.elementKind) { supplementaryView, elementKind, indexPath in
            supplementaryView.label.text = SectionKind(rawValue: indexPath.section)?.stringValue
        }
        
        datasource?.supplementaryViewProvider = { collectionView, elementkind, indexPath in
            collectionView.dequeueConfiguredReusableSupplementary(using: header, for: indexPath)
        }
    }
    
    func initialData() {
        let listArray = [
            DistintCollectModel(image: "list.bullet.rectangle.fill"),
            DistintCollectModel(image: "list.bullet.rectangle.fill"),
            DistintCollectModel(image: "list.bullet.rectangle.fill"),
        ]
        let listArray1 = [
            DistintCollectModel(image: "paris"),
            DistintCollectModel(image: "cusco"),
            DistintCollectModel(image: "iceland"),
            DistintCollectModel(image: "italy")
        ]
        let listArray2 = [
            DistintCollectModel(image: "paris"),
            DistintCollectModel(image: "cusco"),
            DistintCollectModel(image: "iceland"),
            DistintCollectModel(image: "paris"),
            DistintCollectModel(image: "iceland"),
            DistintCollectModel(image: "italy")
        ]
        var snapshot = NSDiffableDataSourceSnapshot<SectionKind, DistintCollectModel>()
        SectionKind.allCases.forEach { kind in
            snapshot.appendSections([kind])
            switch kind {
            case .list: snapshot.appendItems(listArray, toSection: kind)
            case .grid: snapshot.appendItems(listArray1, toSection: kind)
            case .horizontal: snapshot.appendItems(listArray2, toSection: kind)
            }
        }
        datasource?.apply(snapshot, animatingDifferences: false)
    }
}
