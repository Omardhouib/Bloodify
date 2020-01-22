//
//  RankTableViewCell.swift
//  Bloodify
//
//  Created by Omar Dhouib on 1/14/19.
//  Copyright © 2019 Omar Dhouib. All rights reserved.
//

import UIKit

class RankTableViewCell: UITableViewCell {

    @IBOutlet weak var nomprenom: UILabel!
    @IBOutlet weak var nbrang: UILabel!
    @IBOutlet weak var nbpoints: UILabel!
    @IBOutlet weak var voir: UIButton!
    @IBOutlet weak var userimage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
