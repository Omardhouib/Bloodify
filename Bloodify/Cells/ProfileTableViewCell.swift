//
//  ProfileTableViewCell.swift
//  Bloodify
//
//  Created by Omar Dhouib on 1/5/19.
//  Copyright © 2019 Omar Dhouib. All rights reserved.
//

import UIKit

protocol TableViewnew {
    func onClickCell(index: Int)
}

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var usernom: UILabel!
    @IBOutlet weak var nbpoches: UILabel!
    @IBOutlet weak var grpsanguin: UILabel!
    @IBOutlet weak var region: UILabel!
    
    var cellDelegate: TableViewnew?
    var index: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func Approuver(_ sender: UIButton) {
        cellDelegate?.onClickCell(index: (index?.row)!)
    }
}
