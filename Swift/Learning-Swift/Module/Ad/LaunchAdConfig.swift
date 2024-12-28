//
//  CommonTextField.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/25.
//

import UIKit

let Z_SCREEN_WIDTH = UIScreen.main.bounds.size.width
let Z_SCREEN_HEIGHT = UIScreen.main.bounds.size.height

public typealias LaunchClosure = ()->()

public class ZLaunchAdImageResourceConfigure: NSObject {
    
    public var imageNameOrImageURL: String?
    public var imageDuration: Int = 3
    public var imageFrame = CGRect(x: 0, y: 0, width: Z_SCREEN_WIDTH, height: Z_SCREEN_HEIGHT-100)
}
