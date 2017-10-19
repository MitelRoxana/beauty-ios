//
//  ServiceTableViewCell.swift
//  Beauty
//
//  Created by Roxana Mitel on 19/10/2017.
//  Copyright © 2017 roxanamitel. All rights reserved.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {
    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var service: Service? {
        didSet {
            guard let service = service  else { return }
            serviceImage.image = service.image
            title.text = service.name
            descriptionLabel.text = service.description
        }
    }
}
