//
//  CommonTextField.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/25.
//

import Foundation
import UIKit

class LaunchAdButton: UIButton {
    
    fileprivate var adDuration: Int!
    public var frames = CGRect(x: Z_SCREEN_WIDTH - 75,y: 60, width: 60, height: 30)
    public var backgroundColors = UIColor.black.withAlphaComponent(0.4)
    public var text: NSString = "跳过"
    public var textFont = UIFont.systemFont(ofSize: 14)
    public var textColor = UIColor.white
    public var timeFont = UIFont.systemFont(ofSize: 15)
    public var timeColor = UIColor.red
    public var cornerRadius: CGFloat = 5
    public var borderColor: UIColor = UIColor.clear
    public var borderWidth: CGFloat = 1
    
    func setDuration(_ duration: Int) {
        adDuration = duration
        isHidden = false
        let time = "\(duration)" as NSString
        let title = NSMutableAttributedString(string: "\(text) \(time)")
        title.addAttributes([.foregroundColor: textColor, .font: textFont], range: NSMakeRange(0, text.length))
        title.addAttributes([.foregroundColor: timeColor, .font: timeFont], range: NSMakeRange(text.length+1, time.length))
        setAttributedTitle(title, for: .normal)
    }
    
    func setSkipApperance() {
        backgroundColor = backgroundColors
        self.frame = frames
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
    }
}
