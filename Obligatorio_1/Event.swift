//
//  Event.swift
//  Obligatorio_1
//
//  Created by Admin on 23/04/2018.
//  Copyright © 2018 UCU. All rights reserved.
//

import UIKit

class Event{ //Gol en contra?
    
    var time: Int
    var emoji: String
    var playerName: String
    var countryTeamName: String
    
    init(time: Int, emoji: String, playerName: String, countryTeamName: String) {
        
        self.time = time
        self.emoji = emoji
        self.playerName = playerName
        self.countryTeamName = countryTeamName
    }
    
}
