//
//  ViewController.swift
//  Beauty
//
//  Created by Roxana Mitel on 18/10/2017.
//  Copyright © 2017 roxanamitel. All rights reserved.
//

import UIKit
import GoogleAPIClientForREST
import GoogleSignIn
import FontAwesome_swift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var googleIcon: UILabel!
    
    let viewModel = LoginViewModel()
    
    let bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        googleIcon.font = UIFont.fontAwesome(ofSize: 20)
        googleIcon.text = String.fontAwesomeIcon(name: .google)
        initialConfig()
        
        viewModel.onLoginFinished = { error  in
            if let error = error {
                self.presentAlertWithTitle(title: "Warning", message: error)
                return
            }
            if let viewController = UIStoryboard.main.instantiateViewController(withIdentifier: Identifiers.Main.homeNavigationViewController) as? UINavigationController {
                    self.present(viewController, animated: true, completion: nil)
            }
        }
    }
    
    private func initialConfig() {
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
    }

    @IBAction func login(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
}

extension LoginViewController: GIDSignInDelegate, GIDSignInUIDelegate{
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            self.presentAlertWithTitle(title: "Authentication Error", message: error.localizedDescription)
            GoogleCalendarManager.sharedInstance.service.authorizer = nil
        } else {
            GoogleCalendarManager.sharedInstance.service.authorizer = user.authentication.fetcherAuthorizer()
            presentHome()
        }
    }
    
    private func presentHome() {
        if let homeViewController = UIStoryboard.main.instantiateViewController(withIdentifier: Identifiers.Main.homeNavigationViewController) as? UINavigationController {
            self.present(homeViewController, animated: true, completion: nil)
        }
    }
}

