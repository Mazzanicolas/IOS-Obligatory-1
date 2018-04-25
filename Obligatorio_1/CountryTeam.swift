//
//  Country.swift
//  Obligatorio_1
//
//  Created by Admin on 23/04/2018.
//  Copyright © 2018 UCU. All rights reserved.
//

import UIKit

class CountryTeam {
        
    var name:        String
    var teamMembers: Array<TeamMember>
    var logo:        UIImage
    
    init(name: String, teamMembers: Array<TeamMember>, logo: UIImage) {    
        self.name        = name
        self.teamMembers = teamMembers
        self.logo        = logo
    }
}
