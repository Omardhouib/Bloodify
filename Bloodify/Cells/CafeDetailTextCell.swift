//
//  CafeDetailTextCell.swift
//  Cafegram2EN
//
//  Created by Farukh IQBAL on 10/06/2018.
//  Copyright © 2018 Farukh IQBAL. All rights reserved.
//

import UIKit

class CafeDetailTextCell: UITableViewCell {
    
    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 0
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
