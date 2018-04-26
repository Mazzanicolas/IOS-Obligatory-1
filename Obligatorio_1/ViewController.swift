//
//  ViewController.swift
//  Obligatorio_1
//
//  Created by SP19 on 19/4/18.
//  Copyright © 2018 UCU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, 
UITableViewDataSource {
    
    var matches:Array<Match>!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate   = self
        tableView.dataSource = self
        
        let stadium: Stadium = Stadium(name: "Luzhniki Stadium", logo: /*LOGO*/)
        let date:    Date    = Date(timeIntervalSinceReferenceDate: 118800)
        
        let event1:  Event   = Event('00',⚽,'Le gol con lo pie', "Russia") 
        let event2:  Event   = Event('20',⚽,'Le gol con lo pie', "Russia") 
        let event3:  Event   = Event('30',⚽,'Le gol con lo pie', "Uruguay") 
        let event4:  Event   = Event('60',⚽,'Le gol con lo pie', "Russia") 
        let eventList: Array<Event> = [event1, event2, event3, event4]

        let russiaTeamMemberNames: Array<String> = ["Igor Akinfeev","Aleksandr Selikhov","Andrey Lunyov","Roman Neustadter","Ilya Kutepov","Andrei Semyonov"]
        let russiaTeamMemberIds:   Array<String> = ["1","12","99","3","4","5"]
        let russiaTeamMemberClubs: Array<String> = ["Russia CSKA Moscow","Russia Spartak Moscow","Russia Zenit Saint Petersburge","Turkey Fenerbahce","Russia Spartak Moscow","Russia Akhmat Grozny"]
        russiaTeamMembers = createTeamMembers(name: russiaTeamMemberNames, temporalId: russiaTeamMemberIds, countryTeam: "Russia", club: russiaTeamMemberClubs)
        russia = countryTeam(name: "Russia", russiaTeamMember,logo: /*"LOGO"*/)

        let uruguayTeamMemberNames: Array<String> = ["Fernando Muslera","Martín Silva","Martín Campaña","Maxi Pereira","Diego Godín","José María Giménez"]
        let uruguayTeamMemberIds:   Array<String> = ["1","23","12","16","3","2"]
        let uruguayTeamMemberClubs: Array<String> = ["Turkey Galatasaray","Brazil Vasco da Gama","Argentina Independiente","Portugal Porto","Spain Atlético Madrid","Spain Atlético Madrid"]
        createTeamMembers(name: uruguayTeamMemberNames, temporalId: uruguayTeamMemberIds, countryTeam: "Uruguay", club: uruguayTeamMemberClubs)
        uruguay = countryTeam(name: "Uruguay", uruguayTeamMember,logo: /*"LOGO"*/)

        Match(homeTeam: russia, awayTeam: uruguay,3,1,date)
    }

    func createTeamMembers(teamMemberNames: Array<String>, teamMemberIds: Array<String>, countryTeam: String, teamMemberClubs: Array<String>) -> Array<TeamMember>{
        var teamMembers = Array<TeamMember>
        for index in 1...6 {
            teamMembers.append(TeamMember(name:teamMemberNames[index], temporalId:teamMemberIds[index], countryTeam:countryTeam, club:teamMemberClubs))
        }
        return teamMembers
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! MatchTableViewCell
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: nil)
    }
}

