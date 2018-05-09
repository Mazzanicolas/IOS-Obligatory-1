//
//  TeamMember.swift
//  Obligatorio_1
//
//  Created by Admin on 22/04/2018.
//  Copyright © 2018 UCU. All rights reserved.
//

class TeamMember {
    
    var name:        String
    var teamMemberId:  String // (FIXED) RENAME: ¿teamMemberID?
    var countryTeam: String
    var club:        String?// (FIX) Si no le pasas un club, no se rompe?, queda en nil?  -Se Rompe si forzas el unwrap
    var rol:         String
    
    init(name: String, temporalId: String, countryTeam: String, club: String?, rol: String) {
        self.name        = name
        self.teamMemberId  = temporalId
        self.countryTeam = countryTeam
        self.club        = club
        self.rol         = rol
    }
    
}
