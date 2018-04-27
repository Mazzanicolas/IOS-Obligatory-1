//
//  CountryTeamViewController.swift
//  Obligatorio_1
//
//  Created by Admin on 23/04/2018.
//  Copyright © 2018 UCU. All rights reserved.
//

import UIKit

class CountryTeamViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    var country: CountryTeam!
    var nextMatches: Array<Match>!
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var playersTableView: UITableView!
    @IBOutlet weak var nextMatchesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = country.name
        countryImage.image = country.logo
        playersTableView.delegate = self
        playersTableView.dataSource = self
        nextMatchesCollectionView.delegate = self
        nextMatchesCollectionView.dataSource = self
        nextMatches = Utils.createDummyData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "nextMatchCellId", for: indexPath) as! NextMachtCollectionViewCell
        let match = nextMatches[0]
        let rivalTeam = getRivalTeam(match: match, country: country)
        cell.countryLogoImage.image = rivalTeam.logo
        cell.countryNameLabel.text = rivalTeam.name
        cell.matchDateLabel.text = Utils.formatDate(date: match.date)
        cell.stadiumNameLabel.text = match.stadium.name
        return cell
    }
    
    func getRivalTeam(match: Match, country: CountryTeam)->CountryTeam{
        if match.homeTeam.name != country.name {
            return match.homeTeam
        }
        return match.awayTeam
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.teamMembers.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCellId", for: indexPath) as! PlayerTableViewCell
        let player = country.teamMembers[indexPath.row]
        cell.temporalIdLabel.text = player.temporalId
        cell.playerNameLabel.text = player.name
        cell.playerClubLabel.text = player.club//Checkear nils
        return cell
    }

}
