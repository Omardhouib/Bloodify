//
//  Message1TableViewCell.swift
//  Bloodify
//
//  Created by Omar Dhouib on 1/15/19.
//  Copyright © 2019 Omar Dhouib. All rights reserved.
//

import UIKit

class Message1TableViewCell: UITableViewCell {

    @IBOutlet weak var messageview: UITextView!
    @IBOutlet weak var emailview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
