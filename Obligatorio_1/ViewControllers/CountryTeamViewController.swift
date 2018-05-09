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
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "nextMatchCellId", for: indexPath) as! NextMachtCollectionViewCell
        let match = nextMatches[indexPath.row]
        let rivalTeam = getRivalTeam(match: match, country: country)
        cell.countryLogoImage.image = UIImage(named: rivalTeam.logoName)
        cell.countryNameLabel.text  = rivalTeam.name
        cell.matchDateLabel.text    = Utils.formatDateShort(date: match.date)
        cell.stadiumNameLabel.text  = match.stadium.name
        return cell
    }
    
    func getRivalTeam(match: Match, country: CountryTeam)->CountryTeam{
        if match.homeTeam.name != country.name {
            return match.homeTeam
        }
        return match.awayTeam
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
