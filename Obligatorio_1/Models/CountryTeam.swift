//
//  Country.swift
//  Obligatorio_1
//
//  Created by Admin on 23/04/2018.
//  Copyright © 2018 UCU. All rights reserved.
//
class CountryTeam {
        
    var name:        String
    var teamMembers: Array<TeamMember>
    var logoName:    String
    
    init(name: String, teamMembers: Array<TeamMember>, logoName: String) {
        self.name        = name
        self.teamMembers = teamMembers
        self.logoName    = logoName
    }
    
}
