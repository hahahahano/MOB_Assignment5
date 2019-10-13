//
//  AnimalTableViewCell.swift
//  group18_assignment5
//
//  Created by Group 18 on 10/13/19.
//  Copyright © 2019 Group 18. All rights reserved.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var aniName: UILabel!
    @IBOutlet weak var aniPhoto: UIImageView!
    @IBOutlet weak var aniSciName: UILabel!
    @IBOutlet weak var aniClass: UILabel!
    @IBOutlet weak var aniWeight: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
