//
//  GridCollectionView.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/3.
//

import UIKit

class GridCollectionView: UICollectionView {
    
    static let elementKind = "collection-section-header"
    
    // please use autoLayout to resizing the view
    init() {
        
        let itemLayout = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalWidth(1/2))
        
//        let item = NSCollectionLayoutItem(layoutSize: itemLayout)
       
        let badgeAnchor = NSCollectionLayoutAnchor(edges: [.top, .trailing], fractionalOffset: CGPoint(x: 0.3, y: -0.3))
        let badgeSize = NSCollectionLayoutSize(widthDimension: .absolute(20),
                                              heightDimension: .absolute(20))
        let supplementaryItem = NSCollectionLayoutSupplementaryItem(layoutSize: badgeSize, elementKind: "badge-kind", containerAnchor: badgeAnchor)
        let item = NSCollectionLayoutItem(layoutSize: itemLayout, supplementaryItems: [supplementaryItem])
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(UIScreen.main.bounds.size.width / 2)), subitems: [item])
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 10, leading: 10, bottom: 0, trailing: 10)
//        section.interGroupSpacing = 10
        
        let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSize, elementKind: GridCollectionView.elementKind, alignment: .top)
        
        header.pinToVisibleBounds = true
        
        section.boundarySupplementaryItems = [header]
      
        let layout = UICollectionViewCompositionalLayout(section: section)
        super.init(frame: .zero, collectionViewLayout: layout)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    init(nested: Bool) {
        if nested {
            if #available(iOS 16.0, *) {
                let leadingItem = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6),
                                                      heightDimension: .fractionalHeight(1.0)))
                leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0)

                let trailingItem = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(0.45)))
                
                trailingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                let trailingGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4),
                                                       heightDimension: .fractionalHeight(1.0)),
                    repeatingSubitem: trailingItem,
                    count: 2)
                let nestedGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(0.4)),
                    subitems: [leadingItem, trailingGroup])
                let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSize, elementKind: GridCollectionView.elementKind, alignment: .top)
                
                header.pinToVisibleBounds = true
                
                let section = NSCollectionLayoutSection(group: nestedGroup)
                section.boundarySupplementaryItems = [header]
                
                section.orthogonalScrollingBehavior = .continuous
                let layout = UICollectionViewCompositionalLayout(section: section)
                super.init(frame: .zero, collectionViewLayout: layout)
                self.translatesAutoresizingMaskIntoConstraints = false
            } else {
                super.init(frame: .zero, collectionViewLayout: .init())
            }
        } else {
            super.init(frame: .zero, collectionViewLayout: .init())
        }
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
