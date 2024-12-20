//
//  CommonTextField.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/25.
//

import UIKit

class LaunchAdAnimation: NSObject, CAAnimationDelegate {
    
    private let animationDuration = 0.8
    private var animationView: UIView!
    
    func animationType(animationView: UIView, animationClosure: @escaping LaunchClosure) {
        let closure = {
            UIView.setAnimationsEnabled(false)
            animationClosure()
            UIView.setAnimationsEnabled(true)
        }
        if let window = UIApplication.shared.delegate?.window {
            UIView.transition(with: window!, duration: animationDuration, options: animationOptions(), animations: closure, completion: nil)
        }
    }
    
    private func animationOptions() -> UIView.AnimationOptions {    
        return .transitionCrossDissolve
    }
}
