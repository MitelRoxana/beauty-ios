//
//  HomeViewController.swift
//  Beauty
//
//  Created by Roxana Mitel on 19/10/2017.
//  Copyright © 2017 roxanamitel. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addRerservationButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "L'ere de la Beaute"
        if let navigator = self.navigationController {
            navigator.isNavigationBarHidden = false
            self.navigationItem.setHidesBackButton(true, animated: false)
        }
    }
    
    @IBAction func addReservation(_ sender: Any) {
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Datasource.shared.services.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "serviceCell", for: indexPath) as! ServiceTableViewCell
        cell.service = Datasource.shared.services[indexPath.row]
        return cell
    }
}
