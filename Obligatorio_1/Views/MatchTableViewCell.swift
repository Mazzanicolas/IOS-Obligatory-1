//
//  MatchTableViewCell.swift
//  Obligatorio_1
//
//  Created by SP19 on 19/4/18.
//  Copyright © 2018 UCU. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell  {

    @IBOutlet weak var dateLabel:         UILabel!
    @IBOutlet weak var placeLabel:        UILabel!
    @IBOutlet weak var groupLabel:        UILabel!
    @IBOutlet weak var homeTeamImageView: UIImageView!
    @IBOutlet weak var awayTeamImageView: UIImageView!
    @IBOutlet weak var homeTeamLabel:     UILabel!
    @IBOutlet weak var awayTeamLabel:     UILabel!
    @IBOutlet weak var homeScoreLabel:    UILabel!
    @IBOutlet weak var awayScoreLabel:    UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
}
