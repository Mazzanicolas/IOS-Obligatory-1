//
//  PlaceHolderMatchTableViewCell.swift
//  Obligatorio_1
//
//  Created by Bruno Scigliano on 5/6/18.
//  Copyright © 2018 UCU. All rights reserved.
//

import UIKit

class PlaceHolderMatchTableViewCell: UITableViewCell {

    @IBOutlet weak var matchDateLabel: UILabel!
    @IBOutlet weak var stadiumLabel:   UILabel!
    @IBOutlet weak var matchTypeLabel: UILabel!
    @IBOutlet weak var homeTeamLabel:  UILabel!
    @IBOutlet weak var awayTeamLabel:  UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
