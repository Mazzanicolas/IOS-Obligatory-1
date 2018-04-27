//
//  Utils.swift
//  Obligatorio_1
//
//  Created by SP19 on 26/4/18.
//  Copyright © 2018 UCU. All rights reserved.
//

import Foundation

class Utils {
    
    private static let formatter = DateFormatter()
    
    static func formatDate(date:Date) -> String{
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    static func createDummyData() -> Array<Match>{
        
        var matches:Array<Match>! = []
        
        let stadium: Stadium = Stadium(name: "Luzhniki Stadium", logo: #imageLiteral(resourceName: "luzhniki stadium"))
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        let date:    Date    =  formatter.date(from:"25/06/2018 18:00")!
        
        let event1:  Event   = Event(time: 00,emoji: "⚽",eventDescription: "le gol con loh pie", countryTeamName: "Russia")
        let event2:  Event   = Event(time: 20,emoji: "⚽",eventDescription: "le gol con loh pie", countryTeamName: "Russia")
        let event3:  Event   = Event(time: 30,emoji: "⚽",eventDescription: "le gol con loh pie", countryTeamName: "Uruguay")
        let event4:  Event   = Event(time: 60,emoji: "⚽",eventDescription: "le gol con loh pie", countryTeamName: "Russia")
        let eventList: Array<Event> = [event1, event2, event3, event4]
        
        let russiaTeamMemberNames: Array<String> = ["Igor Akinfeev","Aleksandr Selikhov","Andrey Lunyov","Roman Neustadter","Ilya Kutepov","Andrei Semyonov"]
        let russiaTeamMemberIds:   Array<String> = ["1","12","99","3","4","5"]
        let russiaTeamMemberClubs: Array<String> = ["Russia CSKA Moscow","Russia Spartak Moscow","Russia Zenit Saint Petersburge","Turkey Fenerbahce","Russia Spartak Moscow","Russia Akhmat Grozny"]
        let russiaTeamMembers = createTeamMembers(teamMemberNames: russiaTeamMemberNames, teamMemberIds: russiaTeamMemberIds, countryTeam: "Russia", teamMemberClubs: russiaTeamMemberClubs)
        let russia = CountryTeam(name: "Russia", teamMembers: russiaTeamMembers,logo: #imageLiteral(resourceName: "367px-Coat_of_Arms_of_the_Russian_Federation_2.svg"))
        
        let uruguayTeamMemberNames: Array<String> = ["Fernando Muslera","Martín Silva","Martín Campaña","Maxi Pereira","Diego Godín","José María Giménez"]
        let uruguayTeamMemberIds:   Array<String> = ["1","23","12","16","3","2"]
        let uruguayTeamMemberClubs: Array<String> = ["Turkey Galatasaray","Brazil Vasco da Gama","Argentina Independiente","Portugal Porto","Spain Atlético Madrid","Spain Atlético Madrid"]
        let uruguayTeamMembers = createTeamMembers(teamMemberNames: uruguayTeamMemberNames, teamMemberIds: uruguayTeamMemberIds, countryTeam: "Uruguay", teamMemberClubs: uruguayTeamMemberClubs)
        let uruguay = CountryTeam(name: "Uruguay", teamMembers: uruguayTeamMembers,logo: #imageLiteral(resourceName: "Uruguayan_Football_Association_logo"))
        
        let match = Match(homeTeam: russia, awayTeam: uruguay,homeScore: nil,awayScore: nil,date: date, events: eventList, stadium: stadium, type: "Group A")
        
        matches.append(match)
        
        return matches
    }
    
    static func createTeamMembers(teamMemberNames: Array<String>, teamMemberIds: Array<String>, countryTeam: String, teamMemberClubs: Array<String>) -> Array<TeamMember>{
        var teamMembers: Array<TeamMember> = []
        for index in 0...5 {
            teamMembers.append(TeamMember(name:teamMemberNames[index], temporalId:teamMemberIds[index], countryTeam:countryTeam, club:teamMemberClubs[index]))
        }
        return teamMembers
    }
}
