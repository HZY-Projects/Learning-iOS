//
//  DistintCollectVIew.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/7.
//

import UIKit

enum SectionKind: Int, CaseIterable {
    case list
    case horizontal
    case grid
    
    var stringValue: String {
        switch self {
        case .list: "list"
        case .horizontal: "horizontal"
        case .grid: "grid"
        }
    }
}

class DistintCollectView: UICollectionView {
    
    let viewModel: DistintCollectViewModel = .init()
    
    init() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, env -> NSCollectionLayoutSection? in
            
            guard let sectionkind = SectionKind(rawValue: sectionIndex) else {
                return nil
            }
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(sectionkind == .list ? 1.0: 0.5),
                                                  heightDimension: .fractionalHeight(1.0))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupHeight: NSCollectionLayoutDimension = switch sectionkind {
            case .list: .absolute(44)
            case .grid: .fractionalWidth(0.4)
            case .horizontal: .fractionalWidth(0.4)
            }
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: groupHeight)
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.interItemSpacing = .fixed(10)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 10, leading: 15, bottom: 20, trailing: 15)
            section.interGroupSpacing = 10
            
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                    heightDimension: .absolute(50))
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: GridCollectionView.elementKind, alignment: .top)
            section.boundarySupplementaryItems = [header]
            
            return section
        }
        super.init(frame: .zero, collectionViewLayout: layout)
        self.delegate = viewModel
        viewModel.registerCell(collectionView: self)
        viewModel.initialData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
