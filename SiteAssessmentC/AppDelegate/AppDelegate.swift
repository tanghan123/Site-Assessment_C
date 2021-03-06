//
//  AppDelegate.swift
//  Site_Assessment_C
//
//  Created by Jacob on 2018/9/11.
//  Copyright © 2018年 Jacob. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
        
        let nav  = storyBoard.instantiateInitialViewController() as! TBaseNavigationViewController
        window?.rootViewController = nav;
        window?.makeKeyAndVisible()
        
        congifureGoole()
        
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
}
// MARK: 配置
extension AppDelegate
{
    fileprivate func congifureGoole() {
        FirebaseApp.app(name: "SignIn")
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().scopes = [kGTLRAuthScopeDriveFile]
        GIDSignIn.sharedInstance().shouldFetchBasicProfile = true
        GIDSignIn.sharedInstance().signInSilently()
    }
}

extension AppDelegate: GIDSignInUIDelegate , GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            //service.authorizer = nil
            AppPreferencse.shared.isLogin = false;
            return
        } else {
            //ViewController.user = user
            print("didSignInFor")
            AppPreferencse.shared.isLogin = true
            AppPreferencse.shared.user = user;
            NotificationCenter.default.post(name: NSNotification.Name(KLoginSuccess), object: nil)
        }
    }
}

