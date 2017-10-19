//
//  Datasource.swift
//  Beauty
//
//  Created by Roxana Mitel on 19/10/2017.
//  Copyright © 2017 roxanamitel. All rights reserved.
//


class Datasource {
    
    static let shared = Datasource()
    
    private(set) lazy var services: [Service] = [
        Service(image: #imageLiteral(resourceName: "hair-image"), name: "Hair Style", description: "Life is to short to have boring hair."),
        Service(image: #imageLiteral(resourceName: "makeup-image"), name: "Makeup", description: "Makeup is art. Beauty is spirit"),
        Service(image: #imageLiteral(resourceName: "eyelashes-image"), name: "Eyelashes", description: "Eyelashes long enough to fly away"),
        Service(image: #imageLiteral(resourceName: "eyebrows-image"), name: "Eyebrows", description: "You thing I'm listening but I'm really just doing your brows in my head."),
        Service(image: #imageLiteral(resourceName: "nails-image"), name: "Manicure", description: "Life is no perfect but your nails can be."),
        Service(image: #imageLiteral(resourceName: "pedicure-image"), name: "Pedicure", description: "Life is no perfect but your nails can be.")
    ]
}
