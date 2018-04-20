//
//  MatchTableViewCell.swift
//  Obligatorio_1
//
//  Created by SP19 on 19/4/18.
//  Copyright © 2018 UCU. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell  {

    @IBOutlet weak var dateLabel:             UILabel!
    @IBOutlet weak var placeLabel:            UILabel!
    @IBOutlet weak var groupLabel:            UILabel!
    @IBOutlet weak var countryLeftImageView:  UIImageView!
    @IBOutlet weak var countryRightImageView: UIImageView!
    @IBOutlet weak var countryLeftLabel:      UILabel!
    @IBOutlet weak var countryRightLabel:     UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
}
