//
//  HomeViewController.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/24.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    
    let resolver = CommonResolver()
    let locationResolver = LocationResolver()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.title = "Home"
        let vc = UIHostingController(rootView: HomeMenu { [weak self] in
            switch $0 {
            case .mapView:
                self?.nextVC()
            case .collectionView, .document, .scrollView:
                self?.nextPage(vc: $0.getVC())
            case .tableView, .activityView, .canlendarView, .unavailableView:
                self?.nextCommonVC(vc: $0.getVC())
            }
        })
        vc.view.frame = self.view.bounds
        view.addSubview(vc.view)
             
        //        let item = UIBarButtonItem(customView: btn)
        //
        //        self.navigationItem.title = "Current"
        //        self.navigationItem.largeTitleDisplayMode = .always
        //        self.navigationItem.setHidesBackButton(false, animated: false)
        //        self.navigationItem.rightBarButtonItem = item
        
        //        let darkendBarTintColor = #colorLiteral(red: 0.5541667552, green: 0.7134873905, blue: 0.5476607554, alpha: 1)
        //
        //        let standardAppearance = UINavigationBarAppearance()
        //        standardAppearance.configureWithOpaqueBackground()
        //        standardAppearance.backgroundColor = darkendBarTintColor
        //
        //        let navBar = self.navigationController!.navigationBar
        //        navBar.standardAppearance = standardAppearance
        //        navBar.scrollEdgeAppearance = standardAppearance
        
        //        if #available(iOS 15.0, *) { // For compatibility with earlier iOS.
        //            navBar.compactScrollEdgeAppearance = compactAppearance
        //        }
        
        //        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func nextVC() {
        let vc = MapVC(resolver: resolver, locationResolver: locationResolver)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // xib
    func nextPage(vc: UIViewController.Type) {
        let storyboard = UIStoryboard(name: String(describing: vc.self), bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: vc.self))
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // code
    func nextCommonVC(vc: UIViewController.Type) {
        let vc = vc.init()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // storyboard present/push segue
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        debugPrint(segue.destination, segue.source)
//    }
}
