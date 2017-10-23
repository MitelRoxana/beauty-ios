//
//  AppDelegate.swift
//  Beauty
//
//  Created by Roxana Mitel on 18/10/2017.
//  Copyright © 2017 roxanamitel. All rights reserved.
//

import UIKit
import GoogleSignIn
import GoogleAPIClientForREST

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
         GIDSignIn.sharedInstance().clientID = "362940309205-br594golef5ptks00kf9ln2g56mvci1t.apps.googleusercontent.com"
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().scopes = GoogleCalendarManager.sharedInstance.scopes
        
        checkUserSession()
        return true
    }
    
    private func checkUserSession() {
        if GoogleCalendarManager.sharedInstance.isLoggedIn() {
            GIDSignIn.sharedInstance().signInSilently()
            presentHome()
        }
    }
    
    private func presentHome() {
        if let homeViewController = UIStoryboard.main.instantiateViewController(withIdentifier: Identifiers.Main.homeNavigationViewController) as? UINavigationController {
            self.window?.rootViewController = homeViewController
            self.window?.makeKeyAndVisible()
        }
    }
}

extension AppDelegate: GIDSignInDelegate, GIDSignInUIDelegate{
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print(error)
            GoogleCalendarManager.sharedInstance.service.authorizer = nil
        } else {
            GoogleCalendarManager.sharedInstance.service.authorizer = user.authentication.fetcherAuthorizer()
            presentHome()
        }
    }
}



