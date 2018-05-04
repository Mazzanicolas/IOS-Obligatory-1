//
//  Event.swift
//  Obligatorio_1
//
//  Created by Admin on 23/04/2018.
//  Copyright © 2018 UCU. All rights reserved.
//

import UIKit

class Event {
    
    var time:             Int
    var emoji:            String
    var eventDescription: String
    var eventShownOn:     String
    
    init(time: Int, emoji: String, eventDescription: String, eventShownOn: String) {
        self.time             = time
        self.emoji            = emoji
        self.eventDescription = eventDescription
        self.eventShownOn     = eventShownOn
    }
    
}
