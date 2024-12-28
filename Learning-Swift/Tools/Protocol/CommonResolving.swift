//
//  CommonProtocol.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/25.
//

import UIKit

public protocol CommonResolving {
    func hiddenNav()
    func hideBottomBar()
    func setBadge(_ number: Int)
    func isLogin() -> Bool
    func getLoginVC() -> LoginViewController
}


public struct CommonResolver: CommonResolving {
        
    // dont use in first level
    public func getCurrentVC() -> UIViewController? {
        guard let scene = UIApplication.shared.connectedScenes
            .filter({ $0 is UIWindowScene })
            .first as? UIWindowScene else {
            return nil
        }
        guard let rootVC = scene.windows.first?.rootViewController else {
            return nil
        }
        var currentVC = rootVC
        while let presentedVC = rootVC.presentedViewController {
            currentVC = presentedVC
        }
        return currentVC
    }
    
    public func getNav() -> UINavigationController? {
        getCurrentVC()?.navigationController
    }
    
    public func hiddenNav() {
        if let nav = getNav()?.navigationController {
            nav.setNavigationBarHidden(true, animated: false)
        }
    }
    
    public func hideBottomBar() {
        if let nav = getNav()?.navigationController {
            nav.hidesBottomBarWhenPushed = true
        }
    }
    
    public func setBadge(_ number: Int) {
        guard let currentVC = getCurrentVC() else {
            return
        }
        currentVC.tabBarItem.badgeValue = "\(number)"
    }
    
    public func isLogin() -> Bool {
        LoginManager.main.isLogin
    }
    
    public func getLoginVC() -> LoginViewController {
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        return loginVC
    }
}
