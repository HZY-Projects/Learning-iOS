//
//  TableViewVC.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/16.
//

import UIKit
import SnapKit
import UniformTypeIdentifiers

class TableViewVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    let cellMarginSize :CGFloat  = 4.0
    let cellIdentify = "basicStyleCell"
    var modelArray: [TableViewModel] = []
    
//    var sort: [[String: [String]].Element] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.dragInteractionEnabled = true
        tableView.dragDelegate = self

        navigationItem.rightBarButtonItem = editButtonItem
    
        // dynamic row height, you can also use snapkit or autoLayout constraint
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(UINib(nibName: "TableViewCells", bundle: nil), forCellReuseIdentifier: cellIdentify)
        
        self.view.addSubview(tableView)
        self.tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
         
        modelArray = [
            TableViewModel(header: "A",
                           subItems: [
                            .init(title: "aski", url: Bundle.main.url(forResource: "UIImage_1", withExtension: "png")!),
                            .init(title: "amani", url: Bundle.main.url(forResource: "UIImage_2", withExtension: "png")!),
                            .init(title: "aluca", url: Bundle.main.url(forResource: "UIImage_3", withExtension: "png")!)
                           ]),
            TableViewModel(header: "B",
                           subItems: [
                            .init(title: "ben", url: Bundle.main.url(forResource: "UIImage_4", withExtension: "png")!),
                            .init(title: "boss", url: Bundle.main.url(forResource: "UIImage_5", withExtension: "png")!),
                            .init(title: "bsxsdada_dadasda-eqeqeq-xasdasd-eqwe-eqweqweqeqeqwe-dadw32-eadasd-23edqd-ad", url: Bundle.main.url(forResource: "UIImage_6", withExtension: "png")!)
                           ]),
            TableViewModel(header: "C",
                           subItems: [
                            .init(title: "cs", url: Bundle.main.url(forResource: "UIImage_7", withExtension: "png")!),
                            .init(title: "cinime", url: Bundle.main.url(forResource: "UIImage_8", withExtension: "png")!),
                            .init(title: "cos", url: Bundle.main.url(forResource: "UIImage_9", withExtension: "png")!)
                           ]),
            TableViewModel(header: "D",
                           subItems: [
                            .init(title: "dark", url: Bundle.main.url(forResource: "UIImage_10", withExtension: "png")!),
                            .init(title: "demon", url: Bundle.main.url(forResource: "UIImage_11", withExtension: "png")!),
                            .init(title: "drik", url: Bundle.main.url(forResource: "UIImage_12", withExtension: "png")!)
                           ]),
            TableViewModel(header: "G",
                           subItems: [
                            .init(title: "groud", url: Bundle.main.url(forResource: "UIImage_13", withExtension: "png")!),
                            .init(title: "glu", url: Bundle.main.url(forResource: "UIImage_14", withExtension: "png")!),
                            .init(title: "good time", url: Bundle.main.url(forResource: "UIImage_15", withExtension: "png")!)
                           ]),
            TableViewModel(header: "H",
                           subItems: [
                            .init(title: "How are you, am fine, what do you think about that, how do you mean, why should be that.", url: Bundle.main.url(forResource: "UIImage_1", withExtension: "png")!),
                            .init(title: "hooly", url: Bundle.main.url(forResource: "UIImage_2", withExtension: "png")!),
                            .init(title: "hp", url: Bundle.main.url(forResource: "UIImage_3", withExtension: "png")!)
                           ]),
            TableViewModel(header: "K",
                           subItems: [
                            .init(title: "kasa", url: Bundle.main.url(forResource: "UIImage_4", withExtension: "png")!),
                            .init(title: "kokoko", url: Bundle.main.url(forResource: "UIImage_5", withExtension: "png")!),
                            .init(title: "kes", url: Bundle.main.url(forResource: "UIImage_6", withExtension: "png")!)
                           ]),
        ]
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.isEditing = editing
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        modelArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return modelArray[section].header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray[section].subItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentify, for: indexPath)
        
        if let cell = cell as? TableViewCells {
            let rows = modelArray[indexPath.section].subItems
            let model = rows[indexPath.row]
            
            cell.label.text = model.title
            cell.icon.image = model.image
            
            ImageCache.publicCache.load(url: model.url as NSURL, item: model) { [weak self] (fetchedItem, image) in
                if let img = image, img != fetchedItem.image {
                    
                    if let vm = self?.modelArray[indexPath.section] {
                        var itemModel = vm.subItems[indexPath.row]
                        itemModel.image = img
                        self?.modelArray[indexPath.section].subItems[indexPath.row] = itemModel
                        self?.tableView.reloadRows(at: [indexPath], with: .none)
                    }
                }
            }
        }
        
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        modelArray.map({ $0.header })
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//
//    }
}

extension TableViewVC: UITableViewDragDelegate {
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let model = modelArray[indexPath.section].subItems[indexPath.row]
        let data = model.title.data(using: .utf8)
        let itemProvider = NSItemProvider()
        itemProvider.registerDataRepresentation(forTypeIdentifier: UTType.plainText.description, visibility: .all) { completion in
                completion(data, nil)
                return nil
            }
        return [UIDragItem(itemProvider: itemProvider)]
    }
    
    func tableView(_ tableView: UITableView, dragSessionWillBegin session: UIDragSession) {
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    func tableView(_ tableView: UITableView, dragSessionDidEnd session: UIDragSession) {
        navigationItem.rightBarButtonItem?.isEnabled = true
    }
}

extension TableViewVC {
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> TableViewCells.EditingStyle {
        .none
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var dataArr = modelArray
        let temp = dataArr[sourceIndexPath.section].subItems[sourceIndexPath.row]
        dataArr[sourceIndexPath.section].subItems.remove(at: sourceIndexPath.row)
        dataArr[destinationIndexPath.section].subItems.insert(temp, at: destinationIndexPath.row)
        modelArray = dataArr
    }
}
