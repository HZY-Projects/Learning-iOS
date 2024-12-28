//
//  CommonToolbar.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/26.
//

import UIKit

class CommonToolbar: UIView {
    
    let closeBlock: () -> Void
    
    init(closeBlock: @escaping () -> Void) {
        self.closeBlock = closeBlock
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let button = UIButton(frame: .init(x: 15, y: 5, width: 40, height: 40))
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(backMethod), for: .touchUpInside)
        button.tintColor = .black
        self.addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func backMethod() {
        closeBlock()
    }
}
