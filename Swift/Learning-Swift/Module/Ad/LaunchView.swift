//
//  CommonTextField.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/25.
//

import UIKit

public class LaunchView: UIView {
    var waitTime: Int = 3
    fileprivate var originalTimer: DispatchSourceTimer?
    fileprivate var dataTimer: DispatchSourceTimer?
    fileprivate var adTapAction: LaunchClosure?
    fileprivate var imageResource: ZLaunchAdImageResourceConfigure?
    fileprivate var skipBtn: LaunchAdButton?
    fileprivate let zLaunchAdAppearTimeStamp = "ZLaunchAdAppearTimeStamp"
    fileprivate var endOfCountDownClosure: LaunchClosure?
    
    fileprivate lazy var launchAdImgView: LaunchAdImageView = {
        let imgView = LaunchAdImageView(frame: .zero)
        imgView.adImageViewClick = { [weak self] in
            self?.launchAdTapAction()
        }
        return imgView
    }()
    
    fileprivate func launchAdTapAction() {
        if adTapAction != nil {
            launchAdVCRemove() {
                self.adTapAction!()
            }
        }
    }
    /// 出现
    fileprivate func show() {
        UIApplication.shared.delegate?.window??.addSubview(self)
    }
    
    public func setImageResource(_ imageResource: ZLaunchAdImageResourceConfigure,
                                       action: LaunchClosure?) {
        self.imageResource = imageResource
        adTapAction = action
        addAdImageView()
    }
    
    /// 倒计时结束回调
    public func endOfCountDown(_ action: LaunchClosure?) {
        self.endOfCountDownClosure = action
    }
        
    
    func appear(showEnterForeground: Bool, timeForWillEnterForeground: Double = 10, customNotificationName: String? = nil) {
        NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: nil) { _ in
            /// 上次出现的时间戳
            let lastAppearTimeStamp = UserDefaults.standard.double(forKey: self.zLaunchAdAppearTimeStamp)
            let currentTimeStamp = self.getSystemTimestamp()
            if currentTimeStamp - lastAppearTimeStamp > timeForWillEnterForeground*1000 {
                self.show()
            }
        }
        NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: nil) { (_) in
            /// 记录时间戳
            UserDefaults.standard.set(self.getSystemTimestamp(), forKey: self.zLaunchAdAppearTimeStamp)
        }
    }
    
    public override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        if newWindow != nil {
            frame = UIScreen.main.bounds
            startTimer()
            addAdImageView()
        }
    }
    
    /// 获取系统时间戳
    fileprivate func getSystemTimestamp() -> Double {
        let date = Date()
        let time = String(format: "%.3f", date.timeIntervalSince1970)
        let timeSp = time.replacingOccurrences(of: ".", with: "") as NSString
        return timeSp.doubleValue
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - setup subview
extension LaunchView {
    
    fileprivate func addAdImageView() {
        guard let imageResource else {
            return
        }
        launchAdImgView.frame = imageResource.imageFrame
        addSubview(launchAdImgView)
        launchAdImgView.image = UIImage(named: imageResource.imageNameOrImageURL ?? "")
        setImage(duration: imageResource.imageDuration)
    }
    
    fileprivate func setImage(duration: Int) {
        let adDuration = max(1, duration)
        skipBtn = LaunchAdButton(type: .custom)
        skipBtn?.titleLabel?.textAlignment = .center
        skipBtn?.addTarget(self, action: #selector(skipBtnClick), for: .touchUpInside)
        skipBtn?.setSkipApperance()
        addSubview(skipBtn!)
        if originalTimer?.isCancelled == true { return }
        adStartTimer(adDuration)
    }
    
    @objc fileprivate func skipBtnClick() {
        launchAdVCRemove()
    }
}

// MARK: - remove
extension LaunchView {
    
    fileprivate func launchAdVCRemove(completion: LaunchClosure? = nil) {
        if originalTimer?.isCancelled == false { originalTimer?.cancel() }
        if dataTimer?.isCancelled == false { dataTimer?.cancel() }
        LaunchAdAnimation().animationType(animationView: self, animationClosure: {
            for (index, view) in self.subviews.enumerated() {
                if index != 0 {
                    view.removeFromSuperview()
                }
            }
            self.skipBtn = nil
            self.removeFromSuperview()
        })
        /// #10 有没有倒计时结束时的回调函数
        if endOfCountDownClosure != nil {
            endOfCountDownClosure!()
        }
        if completion != nil {
            completion!()
        }
    }
}

// MARK: - GCD
extension LaunchView {
    
    fileprivate func startTimer() {
        var duration: Int = waitTime
        originalTimer = DispatchSource.makeTimerSource(flags: [], queue:.global())
        originalTimer?.schedule(deadline: .now(), repeating: .seconds(1), leeway: .milliseconds(duration))
        originalTimer?.setEventHandler(handler: {
            if duration == 0 {
                DispatchQueue.main.async {
                    self.launchAdVCRemove()
                }
                return
            }
            duration -= 1
        })
        originalTimer?.resume()
    }
    
    fileprivate func adStartTimer(_ duration: Int) {
        var adDuration = duration
        dataTimer = DispatchSource.makeTimerSource(flags: [], queue:.global())
        dataTimer?.schedule(deadline: .now(), repeating: .seconds(1), leeway: .milliseconds(adDuration))
        dataTimer?.setEventHandler(handler: {
            DispatchQueue.main.async {
                if self.originalTimer?.isCancelled == false {
                    self.originalTimer?.cancel()
                }
                self.skipBtn?.setDuration(adDuration)
                if adDuration == 0 {
                    self.launchAdVCRemove()
                    return
                }
                adDuration -= 1
            }
        })
        dataTimer?.resume()
    }
}
