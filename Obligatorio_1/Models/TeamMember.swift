//
//  TeamMember.swift
//  Obligatorio_1
//
//  Created by Admin on 22/04/2018.
//  Copyright © 2018 UCU. All rights reserved.
//

class TeamMember {
    
    var name:         String
    var teamMemberId: String
    var countryTeam:  String
    var club:         String?
    var rol:          String
    
    init(name: String, temporalId: String, countryTeam: String, club: String?, rol: String) {
        self.name          = name
        self.teamMemberId  = temporalId
        self.countryTeam   = countryTeam
        self.club          = club
        self.rol           = rol
    }
    
}
