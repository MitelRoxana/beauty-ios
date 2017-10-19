//
//  Service.swift
//  Beauty
//
//  Created by Roxana Mitel on 19/10/2017.
//  Copyright © 2017 roxanamitel. All rights reserved.
//

import Foundation
import  UIKit

struct Service {
    var image: UIImage?
    var name: String?
    var description: String?
    
    init(image: UIImage, name: String, description: String) {
        self.image = image
        self.name = name
        self.description = description
    }
}
