//
//  CommonTextField.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/25.
//

import UIKit
import ImageIO
/// 广告图
class LaunchAdImageView: UIImageView {
    
    var adImageViewClick: LaunchClosure?
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(adImageViewTapAction))
        addGestureRecognizer(tap)
    }
    
    @objc func adImageViewTapAction(_ sender: UITapGestureRecognizer) -> Void {
        if adImageViewClick != nil {
            adImageViewClick!()
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
