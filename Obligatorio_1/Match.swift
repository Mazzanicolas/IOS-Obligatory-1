//
//  Mach.swift
//  Obligatorio_1
//
//  Created by Admin on 23/04/2018.
//  Copyright © 2018 UCU. All rights reserved.
//

import UIKit

class Match {
    
    var homeTeam:  CountryTeam
    var awayTeam:  CountryTeam
    var homeScore: Int?
    var awayScore: Int?
    var date:      Date
    var events:    Array<Event>
    var stadium:   Stadium
    var type:      String
    
    init(homeTeam: CountryTeam, awayTeam: CountryTeam, homeScore: Int?, awayScore: Int?, date: Date, events: Array<Event>, stadium: Stadium, type: String) {
        self.homeTeam  = homeTeam
        self.awayTeam  = awayTeam
        self.homeScore = homeScore
        self.awayScore = awayScore
        self.date      = date
        self.events    = events
        self.stadium   = stadium
        self.type      = type
    }
    
}
