//
//  Tabbar.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/24.
//

import UIKit

class Tabbar: NSObject {
    let tabbar = CustomTabbar()
//    var tabs = [UITab]()
    let array = [(ControllerType.map, "location.circle.fill"), (ControllerType.sun, "sun.max.fill"), (ControllerType.location, "location.circle"), (ControllerType.person, "person.fill")]
    
    let homeVC = HomeViewController()
    let sunVC = SunViewController()
    let locationVC = LocationViewController()
    let personVC = PersonViewController()
    
    override init() {
        super.init()
        let tabItems = array.enumerated().map { index, item in
            UITabBarItem(title: item.0.rawValue, image: UIImage(systemName: item.1), tag: index)
        }
        
        let homeNav = NavigationBar(rootViewController: homeVC)
        let sunNav = NavigationBar(rootViewController: sunVC)
        let locationNav = NavigationBar(rootViewController: locationVC)
        let personNav = NavigationBar(rootViewController: personVC)
        
        tabbar.viewControllers = [homeNav, sunNav, locationNav, personNav]
        
        for tabitem in tabItems {
            switch tabitem.tag {
            case 0: homeVC.tabBarItem = tabitem
            case 1: sunVC.tabBarItem = tabitem
            case 2: locationVC.tabBarItem = tabitem
            case 3: personVC.tabBarItem = tabitem
            default:
                break
            }
        }
       
        homeVC.tabBarItem.badgeValue = "10"
    }
}
