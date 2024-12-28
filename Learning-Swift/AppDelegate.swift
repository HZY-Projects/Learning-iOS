//
//  AppDelegate.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/24.
//

import UIKit
import CoreData
//  When you build your app, Xcode compiles your source files and creates an app bundle for your project. An app bundle is a structured directory that contains the code and resources associated with the app. Resources include the image assets, storyboard files, strings files, and app metadata that support your code. The structure of the app bundle is important, but Xcode knows where your resources need to go, so don’t worry about it for now.
//  当你构建你的app Xcode编译你的资源文件和创建一个app 捆绑包 给你的项目， 一个app 捆绑包是一个直接包含代码和app相关资源的结构， 资源包括支持你代码的图片集 故事板文件 文本文件和 元数据文件等，app捆绑包是很重要的，但是Xcode知道你的资源要放到哪里， 所以你现在并不需要担心。

//Every UIKit app is required to have the following resources:
//App icons   https://icon.wuruihong.com/icon?utm_source=604Cuzkc#/ios
//Launch screen storyboard


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
//    All apps have an associated process, which the UIApplication object represents. Apps also have an app delegate object — an object that conforms to the UIApplicationDelegate protocol — which responds to important events happening within that process. Even a scene-based app uses an app delegate to manage fundamental events like launch and termination. At launch time, UIKit automatically creates the UIApplication object and your app delegate. It then starts your app’s main event loop.
    var window: UIWindow?
    let tabbar = Tabbar()
    let locationResolver = LocationResolver()
    let apns = APNS()
    // Initialize your app’s data structures.
//    Verify that your app has the resources it needs to run.
//    Perform any one-time setup when your app launches for the first time. For example, install templates or user-modifiable files in a writable directory. See Performing one-time setup for your app.
//    Connect to any critical services that your app uses. For example, connect to the Apple Push Notification service if your app supports remote notifications.
//    Check the launch options dictionary for information about why your app launched. See Determine why your app launched.
    
//    Every iOS app has exactly one instance of UIApplication 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let key = "CFBundleVersion"
        let lastVersion = UserDefaults.standard.object(forKey: key) as? String
        let currentVersion = Bundle.main.infoDictionary?[key] as? String
        if let currentVersion, let lastVersion, currentVersion == lastVersion {
            window?.rootViewController = tabbar.tabbar
            window?.makeKeyAndVisible()
            
            let launchAdView = LaunchView(frame: UIScreen.main.bounds)
            launchAdView.backgroundColor = .white
            launchAdView.appear(showEnterForeground: true, timeForWillEnterForeground: 10)
            launchAdView.waitTime = 1
            UIApplication.shared.delegate?.window??.addSubview(launchAdView)
            
            let imageResource = ZLaunchAdImageResourceConfigure()
            imageResource.imageNameOrImageURL = "ad"
            imageResource.imageDuration = 5
            imageResource.imageFrame = UIScreen.main.bounds
            launchAdView.setImageResource(imageResource, action: {
                let vc = UIViewController()
                vc.view.backgroundColor = UIColor.white
                self.tabbar.homeVC.navigationController?.pushViewController(vc, animated: true)
            })
        } else {
            let guildVC = GuildViewController()
            window?.rootViewController = guildVC
            
            guildVC.clickBlock = { [weak self] in
                self?.window?.rootViewController = self?.tabbar.tabbar
            }
            UserDefaults.standard.setValue(currentVersion, forKey: key)
            UserDefaults.standard.synchronize()
            window?.makeKeyAndVisible()
            
            locationResolver.requestAuthorization()
        }
        
        
        UIApplication.shared.registerForRemoteNotifications()
        Task {
            // request alert auth need dev account
            let request = await apns.requestAuth()
            debugPrint(request)
        }
        
//        When the user launches your app, make a good impression by launching quickly. UIKit doesn’t present your app’s interface until after the application(_:didFinishLaunchingWithOptions:) method returns. Performing long-running tasks in that method or your application(_:willFinishLaunchingWithOptions:) method might make your app appear sluggish to the user. Returning quickly is also important when launching to the background because the system limits your app’s background execution time.
//        Move tasks that aren’t critical to your app’s initialization out of the launch-time sequence. For example:
//        Defer the initialization of features that your app doesn’t need immediately.
//        Move important, long-running tasks off your app’s main thread. For example, run them asynchronously on a global dispatch queue.
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        debugPrint(application)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        debugPrint(application)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenComponents = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let _ = tokenComponents.joined()

        // Forward the token to your provider, using a custom method.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Learning_Swift")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

