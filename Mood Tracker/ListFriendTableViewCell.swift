//
//  ListFriendTableViewCell.swift
//  Mood Tracker
//
//  Created by djchai on 10/2/17.
//  Copyright © 2017 djchai. All rights reserved.
//

import UIKit

class ListFriendTableViewCell: UITableViewCell {

    @IBOutlet weak var friendCellView: UIView!
    @IBOutlet weak var friendLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
