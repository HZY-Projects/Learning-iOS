//
//  LoginView.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/26.
//

import UIKit
import Combine
import RxCocoa

class LoginView: UIView {
    
    var logo: UILabel = UILabel()
    var accountTF: CommonTextField!
    var pswTF: CommonTextField!
    var loginBtn: UIButton = .init()
    var viewModel: LoginViewModel = .init()
    var cancellables = Set<AnyCancellable>()
    
    var validTF: Bool {
        if let isAcc = accountTF.text, let isPsw = pswTF.text, !isAcc.isEmpty && !isPsw.isEmpty {
            return true
        }
        return false
    }
    
    var btnBackColor: UIColor {
        loginBtn.isEnabled ? .systemBlue : .systemGray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let image1 = UIImageView(image: UIImage(systemName: "person.circle"))
        let image2 = UIImageView(image: UIImage(systemName: "bubble.and.pencil"))
        accountTF = .init(leftView: image1)
        pswTF = .init(leftView: image2, keyboardType: .numberPad)
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        accountTF.translatesAutoresizingMaskIntoConstraints = false
        pswTF.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        
        
        logo.font = UIFont.boldSystemFont(ofSize: 18)
        
        addSubview(logo)
        NSLayoutConstraint.activate([
            logo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            logo.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            logo.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        addSubview(accountTF)
        accountTF.leadingAnchor.constraint(equalTo: logo.leadingAnchor, constant: 5).isActive = true
        accountTF.trailingAnchor.constraint(equalTo: logo.trailingAnchor, constant: -10).isActive = true
        accountTF.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 15).isActive = true
        accountTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        accountTF.leftView = image1
        
        addSubview(pswTF)
        pswTF.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        pswTF.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: -25).isActive = true
        pswTF.heightAnchor.constraint(equalTo: accountTF.heightAnchor, multiplier: 1).isActive = true
        pswTF.topAnchor.constraint(equalTo: accountTF.bottomAnchor, constant: 15).isActive = true
        pswTF.leftView = image2

        addSubview(loginBtn)
        loginBtn.leadingAnchor.constraint(equalTo: pswTF.leadingAnchor).isActive = true
        loginBtn.trailingAnchor.constraint(equalTo: pswTF.trailingAnchor).isActive = true
        loginBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        loginBtn.layer.cornerRadius = 10
        loginBtn.backgroundColor = .systemBlue
        loginBtn.setTitle("Login", for: .normal)
        let _ = loginBtn.rx.tap.subscribe {
            if let psw = self.pswTF.text, let act = self.accountTF.text {
                self.viewModel.login(paramter: ["token": act, "number": psw])
            }
        } onDisposed: {
            
        }
        
        logo.text = viewModel.logoText
        loginBtn.isEnabled = validTF
        loginBtn.backgroundColor = btnBackColor
        
//        NotificationCenter.default
//            .publisher(for: UITextField.textDidChangeNotification, object: nil)
//            .compactMap {
//                ($0.object as? UITextField)?.text
//            }
//            .filter( { $0.unicodeScalars.allSatisfy({CharacterSet.alphanumerics.contains($0)}) } )
//            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
//            .receive(on: RunLoop.main)
//            .sink { _ in
//
//            } receiveValue: { _ in
//                self.loginBtn.isEnabled = self.validTF
//                self.loginBtn.backgroundColor = self.btnBackColor
//            }
//            .store(in: &cancellables)

        accountTF.$currentText.combineLatest(pswTF.$currentText)
            .filter {
                $0.0.unicodeScalars.allSatisfy({CharacterSet.alphanumerics.contains($0)}) &&
                $0.1.unicodeScalars.allSatisfy({CharacterSet.alphanumerics.contains($0)})
            }
            .debounce(for: .milliseconds(500), scheduler: RunLoop.current)
            .map{ ["acc": $0.0, "psw": $0.1] }
            .sink { result in
                if let acc = result["acc"], let psw = result["psw"], psw.isEmpty || acc.isEmpty {
                    self.loginBtn.isEnabled = false
                } else {
                    self.loginBtn.isEnabled = true
                }
                self.loginBtn.backgroundColor = self.btnBackColor
            }
            .store(in: &cancellables)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
