//
//  AppDelegate.swift
//  Beauty
//
//  Created by Roxana Mitel on 18/10/2017.
//  Copyright © 2017 roxanamitel. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        if Auth.auth().currentUser != nil {
            presentHome()
        }
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)
        
        return handled
    }
    
    private func presentHome() {
        if let homeViewController = UIStoryboard.main.instantiateViewController(withIdentifier: Identifiers.Main.homeNavigationViewController) as? UINavigationController {
            self.window?.rootViewController = homeViewController
            self.window?.makeKeyAndVisible()
        }
    }
    
}

