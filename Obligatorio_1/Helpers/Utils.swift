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
    private static var matches:Array<Match> = []
    
    static func formatDateMedium(date:Date) -> String{
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    static func formatDateShort(date:Date) -> String{
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
    static func createDummyData() -> Array<Match>{
        // Stadiums
        let stadium:  Stadium = Stadium(name: "Luzhniki Stadium",         imageURL: "luzhniki stadium")
        let stadium2: Stadium = Stadium(name: "Saint Petersburg Stadium", imageURL: "Saint Petersburg Stadium")
        // Dates
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        let date:    Date    =  formatter.date(from:"25/06/2018 18:00")!
        let date2:   Date    =  formatter.date(from:"25/08/2018 19:00")!
        // Event List 1
        let event1:  Event   = Event(time: 00,emoji: "⚽",eventDescription: "Un gol", eventShownOn: "Right")
        let event2:  Event   = Event(time: 20,emoji: "⚽",eventDescription: "Un gol", eventShownOn: "Right")
        let event3:  Event   = Event(time: 30,emoji: "⚽",eventDescription: "Un gol", eventShownOn: "Left")
        let event4:  Event   = Event(time: 60,emoji: "⚽",eventDescription: "Un gol", eventShownOn: "Right")
        let eventList: Array<Event> = [event1, event2, event3, event4]
        // Event List 2
        let event21: Event   = Event(time: 06,emoji: "⚽",eventDescription: "Un gol",   eventShownOn: "Right")
        let event22: Event   = Event(time: 19,emoji: "📕",eventDescription: "Roja",     eventShownOn: "Right")
        let event23: Event   = Event(time: 35,emoji: "📒",eventDescription: "Amarilla", eventShownOn: "Left")
        let event24: Event   = Event(time: 83,emoji: "🔺",eventDescription: "Sale",     eventShownOn: "Right")
        let event25: Event   = Event(time: 83,emoji: "🔻",eventDescription: "Entra",    eventShownOn: "Right")
        let eventList2: Array<Event> = [event21, event22, event23, event24, event25]
        //Rols
        let teamMemberRols:  Array<String> = ["Substitute","Substitute","TD","Player","Player","Player","Player"]
        // Russia Team
        let russiaTeamMemberNames: Array<String> = ["Igor Akinfeev","Aleksandr Selikhov","Stanislav Cherchesov","Andrey Lunyov","Roman Neustadter","Ilya Kutepov","Andrei Semyonov"]
        let russiaTeamMemberIds:   Array<String> = ["1","12","DT","99","3","4","5"]
        let russiaTeamMemberClubs: Array<String> = ["Russia CSKA Moscow","Russia Spartak Moscow","","Turkey Fenerbahce","Russia Spartak Moscow","Russia Akhmat Grozny"]
        let russiaTeamMembers = createTeamMembers(teamMemberNames: russiaTeamMemberNames, teamMemberIds: russiaTeamMemberIds, countryTeam: "Russia", teamMemberClubs: russiaTeamMemberClubs,teamMemberRols: teamMemberRols)
        let russia = CountryTeam(name: "Russia", teamMembers: russiaTeamMembers,logoName: "367px-Coat_of_Arms_of_the_Russian_Federation_2.svg")
        // Uruguay Team
        let uruguayTeamMemberNames: Array<String> = ["Fernando Muslera","Martín Silva","Oscar Tabarez","Martín Campaña","Maxi Pereira","Diego Godín","José María Giménez"]
        let uruguayTeamMemberIds:   Array<String> = ["1","23","DT","12","16","3","2"]
        let uruguayTeamMemberClubs: Array<String> = ["Turkey Galatasaray","Brazil Vasco da Gama","","Portugal Porto","Spain Atlético Madrid","Spain Atlético Madrid"]
        let uruguayTeamMembers = createTeamMembers(teamMemberNames: uruguayTeamMemberNames, teamMemberIds: uruguayTeamMemberIds, countryTeam: "Uruguay", teamMemberClubs: uruguayTeamMemberClubs,teamMemberRols: teamMemberRols)
        let uruguay = CountryTeam(name: "Uruguay", teamMembers: uruguayTeamMembers, logoName: "Uruguayan_Football_Association_logo")
        // gg Peru Team
        // (FIXED) A Ricardo Gareca lo estamos poniendo como DT y le estamos pasando "Universidad San Martín" como club, no deberia de tener. cambiar por nil. lo mismo para otros paises
        let peruTeamMemberNames:    Array<String> = ["Carlos Cáceda","José Carvallo","Ricardo Gareca","Alejandro Duarte","Alberto Rodríguez","Christian Ramos","Luis Advíncula","Aldo Corzo"]
        let peruTeamMemberIds:      Array<String> = ["6","5","DT","0","72","65","64","24"]
        let peruTeamMemberClubs:    Array<String> = ["Veracruz","UTC","","Junior","Veracruz","BUAP","Universitario de Deportes"]
        let peruTeamMembers = createTeamMembers(teamMemberNames: peruTeamMemberNames, teamMemberIds: peruTeamMemberIds, countryTeam: "Peru", teamMemberClubs: peruTeamMemberClubs,teamMemberRols: teamMemberRols)
        let peru = CountryTeam(name: "Peru", teamMembers: peruTeamMembers, logoName: "257px-Fpf-logo.svg")
        // Match
        let match  = Match.actualMatch(ActualMatch(homeTeam: russia,  awayTeam: uruguay, homeScore: 4,   awayScore: 0,   date: date,  events: eventList,  stadium: stadium,  type: "Group A"))
        let match2 = Match.actualMatch(ActualMatch(homeTeam: russia,  awayTeam: peru,    homeScore: nil, awayScore: nil, date: date2, events: eventList2, stadium: stadium2, type: "Group B"))
        let match3 = Match.actualMatch(ActualMatch(homeTeam: uruguay, awayTeam: peru,    homeScore: nil, awayScore: nil, date: date2, events: eventList2, stadium: stadium,  type: "Group C"))
        let matchPlaceHolder = Match.placeholderMatchBothUnknown(PlaceholderMatchBothUnknown(homeTeam: "Primero Grupo A", awayTeam: "Primero Grupo B",date:date2,stadium:stadium, type: "SemiFinal"))
        matches.append(match)
        matches.append(match2)
        matches.append(match3)
        matches.append(matchPlaceHolder)
        
        
        return matches
    }
    
    static func createTeamMembers(teamMemberNames: Array<String>, teamMemberIds: Array<String>, countryTeam: String, teamMemberClubs: Array<String>, teamMemberRols: Array<String>) -> Array<TeamMember>{
        var teamMembers: Array<TeamMember> = []
        for index in 0...5 {
            var club:String? = nil
            if teamMemberClubs[index] != "" {
                club = teamMemberClubs[index]
            }
            teamMembers.append(TeamMember(name:teamMemberNames[index], temporalId:teamMemberIds[index], countryTeam:countryTeam, club:club,rol: teamMemberRols[index]))
        }
        return teamMembers
    }
    
    static func getNextMatchesOf(countryName:String) -> Array<Match> {
        var nextMatches: Array<Match> = []
    
        for match in matches {
            if match.awayTeam.name == countryName || match.homeTeam.name == countryName && match.homeScore == nil {
                nextMatches.append(match)
            }
        }
        return nextMatches
    }

}
