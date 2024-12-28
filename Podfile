# Uncomment the next line to define a global platform for your project
platform :ios, '15.6'

target 'Learning-Swift' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Learning-Swift
  pod 'RxSwift', '6.8.0'
  pod 'RxCocoa', '6.8.0'
  pod 'Alamofire'
  pod 'SJVideoPlayer'
  pod 'SJUIKit'
  pod 'SnapKit', '~> 5.7.0'
#  pod 'Socket.IO-Client-Swift'
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      end
    end
  end
  
  target 'Learning-SwiftTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Learning-SwiftUITests' do
    # Pods for testing
  end

end
