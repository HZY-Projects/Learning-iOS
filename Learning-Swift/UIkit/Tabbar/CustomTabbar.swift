//
//  CustomTabbar.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/26.
//

import UIKit

class CustomTabbar: UITabBarController, UITabBarControllerDelegate {
    
    var originSelectedIndex = 0
    let resolver: CommonResolving = CommonResolver()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        mode = .automatic
        delegate = self
        tabBar.barTintColor = .red
        tabBar.tintColor = .orange
    }
    
    @available(iOS 3.0, *)
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        self.originSelectedIndex = tabBarController.selectedIndex
        return true
    }

    @available(iOS 2.0, *)
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if tabBarController.selectedIndex == 3 {
            Task {
                if !resolver.isLogin() {
                    tabBarController.selectedIndex = self.originSelectedIndex
                    let vc = resolver.getLoginVC()
                    self.present(vc, animated: true)
                }
            }
        }
    }
    
    @available(iOS 3.0, *)
    func tabBarController(_ tabBarController: UITabBarController, willBeginCustomizing viewControllers: [UIViewController]) {
    
    }

    @available(iOS 3.0, *)
    func tabBarController(_ tabBarController: UITabBarController, willEndCustomizing viewControllers: [UIViewController], changed: Bool) {
        
    }

    @available(iOS 2.0, *)
    func tabBarController(_ tabBarController: UITabBarController, didEndCustomizing viewControllers: [UIViewController], changed: Bool) {
        
    }

//    @available(iOS 7.0, *)
//    func tabBarControllerSupportedInterfaceOrientations(_ tabBarController: UITabBarController) -> UIInterfaceOrientationMask {
//        .portraitUpsideDown
//    }
//
//    @available(iOS 7.0, *)
//    func tabBarControllerPreferredInterfaceOrientationForPresentation(_ tabBarController: UITabBarController) -> UIInterfaceOrientation {
//        .portraitUpsideDown
//    }

//    @available(iOS 7.0, *)
//    func tabBarController(_ tabBarController: UITabBarController, interactionControllerFor animationController: any UIViewControllerAnimatedTransitioning) -> (any UIViewControllerInteractiveTransitioning)? {
//
//    }
//
//    @available(iOS 7.0, *)
//    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
//
//    }
}
