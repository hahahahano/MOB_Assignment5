//
//  AnimalGallery.swift
//  group18_assignment5
//
//  Created by Group 18 on 10/13/19.
//  Copyright © 2019 Group 18. All rights reserved.
//

import UIKit

class AnimalGallery {
    //MARK: Properties
    //var header: String
    var caption: String
    var photo: UIImage?
    
    //MARK: Initialization
    init?(caption:String, photo:UIImage?/*, header:String*/) {
        //self.header = header
        self.caption = caption
        self.photo = photo
    }
}
