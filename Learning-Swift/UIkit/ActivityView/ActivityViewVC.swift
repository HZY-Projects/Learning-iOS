//
//  ActivityView.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/19.
//

import UIKit

class ActivityViewVC: UIViewController {
    
    let activityView = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityView.frame = .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        activityView.color = .red
//        activityView.backgroundColor = .black
        view.addSubview(activityView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(touch))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func touch() {
        if activityView.isAnimating {
            activityView.stopAnimating()
        } else {
            activityView.startAnimating()
        }
    }
}
