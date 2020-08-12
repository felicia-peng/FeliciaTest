//
//  AppDelegate.swift
//  FeliciaTest
//
//  Created by 彭惠 on 2020/1/10.
//  Copyright © 2020 彭惠. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = AMTabBarController()
        self.window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true;
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "完成";
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (status, err) in
            if !status {
                    print("用户不同意授权通知权限")
                return
            }
        }
        return true
    }

    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        application.registerForRemoteNotifications()
    }
    
    private func application(_ application: UIApplication, didReceive notification: UNNotificationRequest) {
        print("didreceive localnotification")
    }
}

