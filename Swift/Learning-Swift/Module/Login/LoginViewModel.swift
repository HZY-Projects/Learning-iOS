//
//  LoginViewModel.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/29.
//

import Foundation

// https://www.free-api.com/use/370 

class LoginViewModel {
    
    let loginManager: LoginManager = LoginManager.main
    
    var logoText: String
    
    init() {
        logoText = "Logo"
    }
    
    func login(paramter: [String : Any]?) {
        loginManager.login(paramter: paramter) { result in
            
        }
    }
}
