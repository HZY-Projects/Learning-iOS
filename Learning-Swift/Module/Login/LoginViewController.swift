//
//  LoginViewController.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/25.
//

import UIKit

public class LoginViewController: UIViewController {
   
    let loginView: LoginView = .init(frame: .zero)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let tool = CommonToolbar {
            self.dismiss(animated: true)
        }
        view.addSubview(tool)
        
        tool.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tool.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tool.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tool.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(loginView)
        loginView.topAnchor.constraint(equalTo: tool.bottomAnchor).isActive = true
        loginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        loginView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        loginView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}
