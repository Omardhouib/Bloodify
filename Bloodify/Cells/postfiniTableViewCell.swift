//
//  postfiniTableViewCell.swift
//  Bloodify
//
//  Created by Omar Dhouib on 1/14/19.
//  Copyright © 2019 Omar Dhouib. All rights reserved.
//

import UIKit

class postfiniTableViewCell: UITableViewCell {

    @IBOutlet weak var nomprenom: UILabel!
    @IBOutlet weak var nbpoches: UILabel!
    @IBOutlet weak var grpsanguin: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var imageuser: UIImageView!{
        didSet {
            imageuser.layer.cornerRadius = imageuser.frame.size.width / 2
            
            // Styled image
            imageuser.clipsToBounds = true
            imageuser.layer.borderColor = UIColor.lightGray.cgColor
            imageuser.layer.borderWidth = 4
        }
    }
    @IBOutlet weak var donorsnumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
