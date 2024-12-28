//
//  GridCollectionVC.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/3.
//

import UIKit

class GridCollectionVC: UIViewController {
//    let collectionView = GridCollectionView(nested: true)
    let collectionView = GridCollectionView()
    var viewModel: GridCollectViewModel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = GridCollectViewModel { _ in
            let vc = GridCollectionDetailVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        view.addSubview(collectionView)
        collectionView.dragDelegate = viewModel
        collectionView.dropDelegate = viewModel
        collectionView.delegate = viewModel
        collectionView.dragInteractionEnabled = true
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        registerCell()
        initialData()
        let addItem = UIBarButtonItem(title: "add", style: .plain, target: self, action: #selector(addItem))
        let moveItem = UIBarButtonItem(title: "move", style: .plain, target: self, action: #selector(moveItem))
        let resetSec = UIBarButtonItem(title: "resetSec", style: .plain, target: self, action: #selector(resetSec))
        let insertSec = UIBarButtonItem(title: "insertSec", style: .plain, target: self, action: #selector(insertSec))
        let currentData = UIBarButtonItem(title: "currentData", style: .plain, target: self, action: #selector(currentData))
        self.navigationItem.rightBarButtonItems = [addItem, moveItem, resetSec, insertSec, currentData]
    }
    
    @objc func addItem() {
        viewModel.addItem()
    }
    
    @objc func moveItem() {
        viewModel.moveItem()
    }
    
    @objc func resetSec() {
        viewModel.resetSection()
    }
    
    @objc func insertSec() {
        viewModel.insertSection()
    }
    
    @objc func currentData() {
        viewModel.refreshData(paramter: viewModel.data)
    }
    
    func registerCell() {
        let cellRegistration = UICollectionView.CellRegistration<GridCollectionCell, GridCollectionModel> { cell, indexPath, item in
            cell.image.image = UIImage(named: item.image)
            cell.titleLab.text = item.title
            cell.desLab.text = item.des
        }
        
        let headerRegistration = UICollectionView.SupplementaryRegistration<GridCollectHeaderView>(elementKind: GridCollectionView.elementKind) { supplementaryView, elementKind, indexPath in
            supplementaryView.label.text = indexPath.section == 0 ? GridSection.feature.rawValue: GridSection.type.rawValue
        }
        
        let supplementaryRegistration = UICollectionView.SupplementaryRegistration<GridBadgeView>(elementKind: "badge-kind") {
            (badgeView, string, indexPath) in
            badgeView.label.text = "\(5)"
//            badgeView.isHidden = true
        }
        
        viewModel.dataSource = UICollectionViewDiffableDataSource<GridSection, GridCollectionModel>(collectionView: collectionView) { collectionView, indexPath, itemIdentifierType in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifierType)
        }
        
        viewModel.dataSource.supplementaryViewProvider = { view, kind, index in
            if kind == "badge-kind" {
                return self.collectionView.dequeueConfiguredReusableSupplementary(using: supplementaryRegistration, for: index)
            }
            return self.collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: index)
        }
    }
    
    func initialData() {
        viewModel.refreshData()
    }
    
    deinit {
        debugPrint("dealloc")
    }
}
