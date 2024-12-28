# Uncomment the next line to define a global platform for your project
workspace 'Learning-Xcode.xcworkspace' #xcworkspace工作区的名字
platform :ios, '15.6'

abstract_target 'CommonPods' do
  
  pod 'Alamofire'
  
  target 'Learning-Swift' do
    # Comment the next line if you don't want to use dynamic frameworks
    use_frameworks!
    project 'Swift/Learning-Swift.xcodeproj'
    # Pods for Learning-Swift
    pod 'RxSwift', '6.8.0'
    pod 'RxCocoa', '6.8.0'
    pod 'SJVideoPlayer'
    pod 'SJUIKit'
    pod 'SnapKit', '~> 5.7.0'
    #  pod 'Socket.IO-Client-Swift'
    
    target 'Learning-SwiftTests' do
      inherit! :search_paths
      # Pods for testing
    end
    
    target 'Learning-SwiftUITests' do
      # Pods for testing
    end
    
  end
  
  target 'Learning-OC' do
    # Comment the next line if you don't want to use dynamic frameworks
    use_frameworks!
    project 'OC/Learning-OC.xcodeproj'
    
    pod 'MJRefresh'
    # Pods for Learning-Swift
    
    #  pod 'Socket.IO-Client-Swift'
    target 'Learning-OCTests' do
      inherit! :search_paths
      # Pods for testing
    end
    
    target 'Learning-OCUITests' do
      # Pods for testing
    end
    
  end
  
  target 'Learning-SwiftUI' do
    # Comment the next line if you don't want to use dynamic frameworks
    use_frameworks!
    project 'SwiftUI/Learning-SwiftUI.xcodeproj'
    # Pods for Learning-Swift
    
    target 'Learning-SwiftUITests' do
      inherit! :search_paths
      # Pods for testing
    end
    
    target 'Learning-SwiftUIUITests' do
      # Pods for testing
    end
    
  end
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      end
    end
  end
  
end
