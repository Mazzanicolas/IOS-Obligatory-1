//
//  EventTableViewCell.swift
//  Obligatorio_1
//
//  Created by SP19 on 19/4/18.
//  Copyright © 2018 UCU. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventTime:       UILabel!
    @IBOutlet weak var leftEmoji:       UILabel!
    @IBOutlet weak var rightPlayerName: UILabel!
    @IBOutlet weak var leftPlayerName:  UILabel!
    @IBOutlet weak var rightEmoji:      UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
