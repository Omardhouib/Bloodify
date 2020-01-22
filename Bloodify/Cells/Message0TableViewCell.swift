//
//  Message0TableViewCell.swift
//  Bloodify
//
//  Created by Omar Dhouib on 1/15/19.
//  Copyright © 2019 Omar Dhouib. All rights reserved.
//

import UIKit

class Message0TableViewCell: UITableViewCell {
    @IBOutlet weak var imageuser: UIImageView!{
        didSet {
            imageuser.layer.cornerRadius = imageuser.bounds.width / 2
            imageuser.clipsToBounds = true
        }
    }
    @IBOutlet weak var nomuser: UILabel!
    @IBOutlet weak var emailuser: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
