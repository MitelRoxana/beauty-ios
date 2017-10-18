//
//  ViewController.swift
//  Beauty
//
//  Created by Roxana Mitel on 18/10/2017.
//  Copyright © 2017 roxanamitel. All rights reserved.
//

import UIKit
import FontAwesome_swift
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var facebookIcon: UILabel!
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        facebookIcon.font = UIFont.fontAwesome(ofSize: 20)
        facebookIcon.text = String.fontAwesomeIcon(name: .facebookF)
        
        viewModel.onLoginFinished = { (user, error)  in
            if let error = error {
                self.presentAlertWithTitle(title: "Warning", message: error)
                return
            }
        }
    }

    @IBAction func loginWithFacebook(_ sender: Any) {
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
            guard error == nil else {
                self.presentAlertWithTitle(title: "Warning", message: error!.localizedDescription)
                return
            }
            if(result?.isCancelled)! {
                self.presentAlertWithTitle(title: "Warning", message: "Login was cancelled by the user!")
            } else if(result?.grantedPermissions.contains("email"))! {
//                ACProgressHUD.shared.showHUD()
//                self?.viewModel.getFBUserData()
            }
            
            guard let accessToken = FBSDKAccessToken.current() else {
                print("Failed to get access token")
                return
            }
            self.viewModel.facebookLoginWithFirebase(accessToken: accessToken)
            
        }
    }
}

