//
//  AppDelegate.swift
//  Ditto
//
//  Created by Rana on 5/21/17.
//  Copyright © 2017 appConcept. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import SlideMenuControllerSwift
import UserNotifications
import SafariServices
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.sharedManager().enable = true
        let notificationTypes: UIUserNotificationType = [UIUserNotificationType.alert, UIUserNotificationType.badge, UIUserNotificationType.sound]
        //let pushNotificationSettings = UIUserNotificationSettings(forTypes: notificationTypes, categories: nil)
        let pushNotificationSettings = UIUserNotificationSettings(types: notificationTypes, categories: nil)
        application.registerUserNotificationSettings(pushNotificationSettings)
        application.registerForRemoteNotifications()
        
//                let slideMenuController = SlideMenuController(mainViewController: mainViewController, leftMenuViewController: leftViewController, rightMenuViewController: rightViewController)
//                self.window?.rootViewController = slideMenuController
//                self.window?.makeKeyAndVisible()
        
        //FirebaseApp.configure();
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // MARK: Register for push
    
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        //        if notificationSettings.types != .None {
        //            application.registerForRemoteNotifications()
        //        }
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        print("DEVICE TOKEN = \(deviceToken)")
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print("Failed to register:", error)
    }
    // MARK: Handle notifications
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject], fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        print(userInfo)
        //        let aps = userInfo["aps"] as! [String: AnyObject]
        //
        //        // 1
        //        if let contentAvaiable = aps["content-available"] as? NSString where contentAvaiable.integerValue == 1 {
        //            // Refresh Podcast
        //            // 2
        //            let podcastStore = PodcastStore.sharedStore
        //            podcastStore.refreshItems { didLoadNewItems in
        //                // 3
        //                completionHandler(didLoadNewItems ? .NewData : .NoData)
        //            }
        //        } else  {
        //            // News
        //            // 4
        //            createNewNewsItem(aps)
        //            completionHandler(.NewData)
        //        }
    }
    
    // MARK: Handle notification action
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [NSObject : AnyObject], completionHandler: () -> Void) {
        // 1
        //        let aps = userInfo["aps"] as! [String: AnyObject]
        //
        //        // 2
        //        if let newsItem = createNewNewsItem(aps) {
        //            if let tabController = window?.rootViewController as? UITabBarController {
        //                tabController.selectedIndex = 1
        //            }
        //
        //            // 3
        //            if identifier == "VIEW_IDENTIFIER", let url = NSURL(string: newsItem.link) {
        //                let safari = SFSafariViewController(URL: url)
        //                window?.rootViewController?.presentViewController(safari, animated: true, completion: nil)
        //            }
        //        }
        //        
        //        // 4
        //        completionHandler()
    }
    
    
}

