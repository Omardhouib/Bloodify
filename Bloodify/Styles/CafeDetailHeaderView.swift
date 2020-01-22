//
//  CafeDetailHeaderView.swift
//  Cafegram2EN
//
//  Created by Farukh IQBAL on 10/06/2018.
//  Copyright © 2018 Farukh IQBAL. All rights reserved.
//

import UIKit

class CafeDetailHeaderView: UIView {
    
    @IBOutlet var headerImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel! {
        didSet {
            nameLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var typeLabel: UILabel! {
        didSet {
            typeLabel.layer.cornerRadius = 5.0
            typeLabel.layer.masksToBounds = true
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
