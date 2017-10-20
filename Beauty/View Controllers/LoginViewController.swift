//
//  ViewController.swift
//  Beauty
//
//  Created by Roxana Mitel on 18/10/2017.
//  Copyright © 2017 roxanamitel. All rights reserved.
//

import UIKit
import FontAwesome_swift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var googleIcon: UILabel!
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        googleIcon.font = UIFont.fontAwesome(ofSize: 20)
        googleIcon.text = String.fontAwesomeIcon(name: .google)
        
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

    @IBAction func login(_ sender: Any) {
        
    }
}

