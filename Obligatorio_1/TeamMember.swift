//
//  TeamMember.swift
//  Obligatorio_1
//
//  Created by Admin on 22/04/2018.
//  Copyright © 2018 UCU. All rights reserved.
//

import UIKit

class TeamMember {
    
    var name:        String
    var temporalId:  String //Ask for Rname
    var countryTeam: String
    var club:        String?
    
    init(name: String, temporalId: String, countryTeam: String, club: String?) {
        
        self.name        = name
        self.temporalId  = temporalId
        self.countryTeam = countryTeam
        self.club        = club
    }
    
}
