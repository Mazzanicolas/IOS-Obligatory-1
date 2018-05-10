//
//  CountryTeamViewController.swift
//  Obligatorio_1
//
//  Created by Admin on 23/04/2018.
//  Copyright © 2018 UCU. All rights reserved.
//

import UIKit

class CountryTeamViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    var country:     CountryTeam!
    var nextMatches: Array<Match>!
    let sectionTitles = ["Player","Substitute","TD"] // (FIX) en vez de inferir el tipo,¿lo hacemos explicito? agregarle : Array<String> - Es lo mismo
    var playersByRol  = [String:Array<TeamMember>]()
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var countryImage:     UIImageView!
    @IBOutlet weak var playersTableView: UITableView!
    @IBOutlet weak var nextMatchesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for title in sectionTitles{
            playersByRol[title] = Array<TeamMember>()
        }
        for player in country.teamMembers{
            playersByRol[player.rol]!.append(player)
        }
        title = country.name
        countryImage.image = UIImage(named: country.logoName)
        playersTableView.delegate   = self
        playersTableView.dataSource = self
        nextMatchesCollectionView.delegate   = self
        nextMatchesCollectionView.dataSource = self
        nextMatches = Utils.getNextMatchesOf(countryName: country.name)
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nextMatches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let match = nextMatches[indexPath.row]
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "nextMatchCellId", for: indexPath) as! NextMachtCollectionViewCell
        let rivalTeam = getRivalTeam(match: match, country: country).0
        let rivalTeamName = getRivalTeam(match: match, country: country).1
        let stadium = getRivalTeam(match: match, country: country).2
        let date = getRivalTeam(match: match, country: country).3
        if let rivalTeam = rivalTeam {
            cell.countryLogoImage.image = UIImage(named: rivalTeam.logoName)

        }
        cell.countryNameLabel.text  = rivalTeamName
        cell.matchDateLabel.text    = date
        cell.stadiumNameLabel.text  = stadium
        return cell
        }
    }
    
    func getRivalTeam(match: Match, country: CountryTeam)->(CountryTeam?, String,String,String){
    switch match {
        case .actualMatch(let actualMatch):
            if actualMatch.homeTeam.name != country.name {
                return (actualMatch.homeTeam, actualMatch.homeTeam.name,actualMatch.stadium.name,Utils.formatDateShort(date: actualMatch.date))
            }
            return (actualMatch.awayTeam, actualMatch.awayTeam.name,actualMatch.stadium.name,Utils.formatDateShort(date: actualMatch.date))
        case .placeholderMatchAwayKnown(let placeholderMatchAwayKnown):
            return (nil, placeholderMatchAwayKnown.homeTeam,placeholderMatchAwayKnown.stadium.name,Utils.formatDateShort(date: placeholderMatchAwayKnown.date))
        case .placeholderMatchHomeKnown(let placeholderMatchHomeKnown):
            return (nil, placeholderMatchHomeKnown.awayTeam,placeholderMatchHomeKnown.stadium.name,Utils.formatDateShort(date: placeholderMatchHomeKnown.date))
        case .placeholderMatchBothUnknown(let placeholderMatchBothUnknown):
            return (nil, "No Match",placeholderMatchBothUnknown.stadium.name,Utils.formatDateShort(date: placeholderMatchBothUnknown.date))
        }
    
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersByRol[sectionTitles[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCellId", for: indexPath) as! PlayerTableViewCell
        let section = indexPath.section
        let row = indexPath.row
        let player = playersByRol[sectionTitles[section]]![row]
        cell.temporalIdLabel.text = player.teamMemberId
        cell.playerNameLabel.text = player.name
       //(FIXED) como club es optional necesitamos un if let, un guard no porque retorna.
        if let teamMemberClub = player.club{
            cell.playerClubLabel.text     = teamMemberClub
            cell.playerClubLabel.isHidden = false //Preguntar
        } else {
            cell.playerClubLabel.isHidden = true
        }
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]+"s"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        if identifier == "fromCountryToMatch" {
            let cell          = sender as! NextMachtCollectionViewCell
            let indexPath     = nextMatchesCollectionView.indexPath(for: cell)!
            let match         = nextMatches[(indexPath.row)]
            let destination   = segue.destination as! MatchViewController
            destination.match = match
        }
    }
    
}
