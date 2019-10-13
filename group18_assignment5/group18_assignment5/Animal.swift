//
//  Animal.swift
//  group18_assignment5
//
//  Created by Group 18 on 10/13/19.
//  Copyright © 2019 Group 18. All rights reserved.
//

import UIKit

class Animal {
    //MARK: Properties
    var name: String
    var photo: UIImage?
    var sciName: String
    var aniClass: String
    var size: String
    
    //MARK: Initialization
    init?(name:String, photo:UIImage?, sciName:String, aniClass:String, size:String) {
        self.name = name
        self.photo = photo
        self.sciName = sciName
        self.aniClass = aniClass
        self.size = size
        
    }
}
