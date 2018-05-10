//
//  Mach.swift
//  Obligatorio_1
//
//  Created by Admin on 23/04/2018.
//  Copyright © 2018 UCU. All rights reserved.
//
import Foundation

enum Match {
    
    case actualMatch(ActualMatch)
    case placeholderMatchBothUnknown(PlaceholderMatchBothUnknown)
    case placeholderMatchHomeKnown(PlaceholderMatchHomeKnown)
    case placeholderMatchAwayKnown(PlaceholderMatchAwayKnown)
}

class ActualMatch {
    
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

class PlaceholderMatchBothUnknown{
    var homeTeam:  String
    var awayTeam:  String
    var date:      Date
    var stadium:   Stadium
    var type:      String
    
    init(homeTeam: String, awayTeam: String, date: Date, stadium: Stadium, type: String) {
        self.homeTeam  = homeTeam
        self.awayTeam  = awayTeam
        self.date      = date
        self.stadium   = stadium
        self.type      = type
    }
    
}

class PlaceholderMatchHomeKnown{
    var homeTeam:  CountryTeam
    var awayTeam:  String
    var date:      Date
    var stadium:   Stadium
    var type:      String
    
    init(homeTeam: CountryTeam, awayTeam: String, date: Date, stadium: Stadium, type: String) {
        self.homeTeam  = homeTeam
        self.awayTeam  = awayTeam
        self.date      = date
        self.stadium   = stadium
        self.type      = type
    }
}

class PlaceholderMatchAwayKnown{
    var homeTeam:  String
    var awayTeam:  CountryTeam
    var date:      Date
    var stadium:   Stadium
    var type:      String
    
    init(homeTeam: String, awayTeam: CountryTeam, date: Date, stadium: Stadium, type: String) {
        self.homeTeam  = homeTeam
        self.awayTeam  = awayTeam
        self.date      = date
        self.stadium   = stadium
        self.type      = type
    }
    
}
