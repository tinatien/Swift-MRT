//
//  FirstSectionTableViewCell.swift
//  swiftcourse_MRT
//
//  Created by TinaTien on 2016/5/4.
//  Copyright © 2016年 TinaTien. All rights reserved.
//

import UIKit

class FirstSectionTableViewCell: UITableViewCell {

    @IBOutlet weak var firstLineLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var firstLineNameLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
           }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
