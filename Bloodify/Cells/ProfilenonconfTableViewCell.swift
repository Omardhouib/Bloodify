//
//  ProfilenonconfTableViewCell.swift
//  Bloodify
//
//  Created by Omar Dhouib on 1/12/19.
//  Copyright © 2019 Omar Dhouib. All rights reserved.
//

import UIKit

class ProfilenonconfTableViewCell: UITableViewCell {
    @IBOutlet weak var userprenom: UILabel!
    @IBOutlet weak var nbpoches: UILabel!
    @IBOutlet weak var grpsanguin: UILabel!
    @IBOutlet weak var region: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
