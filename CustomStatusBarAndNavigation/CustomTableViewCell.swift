//
//  CustomTableViewCell.swift
//  CustomStatusBarAndNavigation
//
//  Created by can.khac.nguyen on 2/14/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
