//
//  HomeDetailVC.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/26.
//

import UIKit

class CollectDetailVC: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var header: UILabel!
    var collectionView: CollectDetailView!
    let viewModel = CollectDetailViewModel()
    let resolver = CommonResolver()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Collect"
//        self.view.backgroundColor = .red
//        navigationItem.prompt = NSLocalizedString("Navigation prompts appear at the top.", comment: "")
//        self.header.text = "Headers"
        self.navigationItem.leftBarButtonItem = .init(image: .init(systemName: "chevron.left"), style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        
//        You must subclass UICollectionViewLayout in order to use it. Before you consider subclassing, however, consider whether you can adapt UICollectionViewCompositionalLayout to your layout needs.
        setSubView()
       
        setData()
    }
    
    func setSubView() {
        let config = UICollectionLayoutListConfiguration(appearance: .sidebar)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
    
        collectionView = CollectDetailView(frame: bounds, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
   
    
    func setData() {
        let containerCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, CollectDetailModel> { (cell, indexPath, item) in
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = item.title
            contentConfiguration.image = UIImage(systemName: item.image)
            contentConfiguration.imageProperties.tintColor = .black
            contentConfiguration.secondaryText = item.des
            contentConfiguration.textProperties.font = .preferredFont(forTextStyle: .title3)
            contentConfiguration.secondaryTextProperties.font = .preferredFont(forTextStyle: .subheadline)
            cell.contentConfiguration = contentConfiguration
            var disclosureOptions = UICellAccessory.OutlineDisclosureOptions(style: .header)
            disclosureOptions.tintColor = .black
            cell.accessories = [.outlineDisclosure(options: disclosureOptions)]
        }
        let CellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, CollectDetailModel> { (cell, indexPath, item) in
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = item.title
            contentConfiguration.textProperties.font = .preferredFont(forTextStyle: .headline)
            cell.contentConfiguration = contentConfiguration
            var disclosureOptions = UICellAccessory.LabelOptions()
            disclosureOptions.font = .preferredFont(forTextStyle: .body)
            cell.accessories = [.label(text: item.des, options: disclosureOptions)]
        }
        viewModel.dataSource = UICollectionViewDiffableDataSource<Section, CollectDetailModel>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: CollectDetailModel) -> UICollectionViewCell? in
            if item.subItems.isEmpty {
                return collectionView.dequeueConfiguredReusableCell(using: CellRegistration, for: indexPath, item: item)
            } else {
                return collectionView.dequeueConfiguredReusableCell(using: containerCellRegistration, for: indexPath, item: item)
            }
        }
        viewModel.updateData()
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension CollectDetailVC {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = viewModel.dataSource?.itemIdentifier(for: indexPath)
        collectionView.deselectItem(at: indexPath, animated: true)
        if let modelVC = model?.controllerType?.viewController() {
            let vc = modelVC.init()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
