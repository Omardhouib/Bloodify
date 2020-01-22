//
//  Message2TableViewCell.swift
//  Bloodify
//
//  Created by Omar Dhouib on 1/15/19.
//  Copyright © 2019 Omar Dhouib. All rights reserved.
//

import UIKit

class Message2TableViewCell: UITableViewCell {

    @IBOutlet weak var messageview: UITextView!{
        didSet {
            messageview.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var dateview: UILabel!
    
    @IBOutlet weak var userimage: UIImageView!{
        didSet {
            userimage.layer.cornerRadius = userimage.bounds.width / 2
            userimage.clipsToBounds = true
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
