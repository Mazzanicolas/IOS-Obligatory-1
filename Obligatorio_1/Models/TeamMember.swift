//
//  TeamMember.swift
//  Obligatorio_1
//
//  Created by Admin on 22/04/2018.
//  Copyright © 2018 UCU. All rights reserved.
//

class TeamMember {
    
    var name:        String
    var temporalId:  String // (FIX) RENAME: ¿teamMemberID?
    var countryTeam: String
    var club:        String?// (FIX) Si no le pasas un club, no se rompe?, queda en nil?
    var rol:         String
    
    init(name: String, temporalId: String, countryTeam: String, club: String?, rol: String) {
        self.name        = name
        self.temporalId  = temporalId
        self.countryTeam = countryTeam
        self.club        = club
        self.rol         = rol
    }
    
}
