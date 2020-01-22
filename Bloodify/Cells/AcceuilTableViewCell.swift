//
//  AcceuilTableViewCell.swift
//  Bloodify
//
//  Created by Tarek El Ghoul on 02/01/2019.
//  Copyright © 2019 Omar Dhouib. All rights reserved.
//

import UIKit


protocol TableViewNew {
    func onClickCell(index: Int)
}

class AcceuilTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageuser: UIImageView! {
        didSet {
            imageuser.layer.cornerRadius = imageuser.frame.size.width / 2
            
            // Styled image
            imageuser.clipsToBounds = true
            imageuser.layer.borderColor = UIColor.lightGray.cgColor
            imageuser.layer.borderWidth = 4
        }
    }
    @IBOutlet weak var prenomuser: UILabel!
    @IBOutlet weak var nomuser: UILabel!
    @IBOutlet weak var nbrepoches: UILabel!
    @IBOutlet weak var grpsanguin: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var donate: UIButton!
    @IBOutlet weak var donorsnumber: UILabel!
    
    var cellDelegate: TableViewNew?
    var index: IndexPath?
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func donate(_ sender: UIButton) {
        cellDelegate?.onClickCell(index: (index?.row)!)
    }
    
}
