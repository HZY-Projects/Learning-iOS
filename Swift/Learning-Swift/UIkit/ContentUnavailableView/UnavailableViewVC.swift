//
//  UnavailableViewVC.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/19.
//

import UIKit

@available(iOS 17.0, *)
class UnavailableViewVC: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    // UIContentUnavailableView
    //      lazy var unavailableView: UIContentUnavailableView = {
    //          var config = UIContentUnavailableConfiguration.empty()
    //          config.text = "暂无数据"
    //          config.textProperties.color = .red
    //          config.secondaryText = "正在加载数据..."
    //          config.image = UIImage(systemName: "exclamationmark.triangle")
    //          config.imageProperties.tintColor = .red
    //          var buttonConfig = UIButton.Configuration.filled()
    //          buttonConfig.title = "加载数据"
    //          config.button = buttonConfig
    //          config.buttonProperties.primaryAction = UIAction(title: "") { _ in
    //              self.loadData()
    //          }
    //          var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
    //          backgroundConfig.backgroundColor = .systemGray6
    //          config.background = backgroundConfig
    //          let unavailableView = UIContentUnavailableView(configuration: config)
    //          unavailableView.frame = UIScreen.main.bounds
    //          return unavailableView
    //      }()
    
    lazy var emptyConfig: UIContentUnavailableConfiguration = {
//        var config = UIContentUnavailableConfiguration.empty()
//        config.text = "暂无数据"
//        config.image = UIImage(systemName: "exclamationmark.triangle")
        let config = UIContentUnavailableConfiguration.loading()
        return config
    }()
    
    var content: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        //          if content.isEmpty {
        //              view.addSubview(unavailableView)
        //          }
        //
        contentUnavailableConfiguration = emptyConfig
    }
    
    func loadData() {
        content = ["iPhone 12", "iPhone 12 Pro", "iPhone 13 mini", "iPhone 13"]
        self.tableView.reloadData()
        // self.unavailableView.removeFromSuperview()
    }
    
    override func updateContentUnavailableConfiguration(using state: UIContentUnavailableConfigurationState) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.contentUnavailableConfiguration = nil
            self.view.backgroundColor = .systemTeal
            self.loadData()
        }
    }
    
}

@available(iOS 17.0, *)
extension UnavailableViewVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = content[indexPath.row]
        cell.imageView?.image = UIImage(systemName: "iphone")
        return cell
    }
}
