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
    
    var matches:Array<Match>! = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate   = self
        tableView.dataSource = self        
        matches = Utils.createDummyData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NormalMatch", for: indexPath) as! MatchTableViewCell // (FIXED) renombrar "id"
        let match = matches[indexPath.row]
        
        switch match {
        case .actualMatch(let actualMatch):
            cell.dateLabel.text          = Utils.formatDateMedium(date: actualMatch.date)
            cell.placeLabel.text         = actualMatch.stadium.name
            cell.groupLabel.text         = actualMatch.type
            cell.homeTeamLabel.text      = actualMatch.homeTeam.name
            cell.homeTeamImageView.image = UIImage(named:actualMatch.homeTeam.logoName)
            cell.awayTeamLabel.text      = actualMatch.awayTeam.name
            cell.awayTeamImageView.image = UIImage(named:actualMatch.awayTeam.logoName)
            cell.homeTeamImageView.isHidden = false
            cell.awayTeamImageView.isHidden = false

            if let awayScore = actualMatch.awayScore, let homeScore = actualMatch.homeScore {
                cell.awayScoreLabel.text     = String(awayScore)+" -"
                cell.homeScoreLabel.text     = "- "+String(homeScore)
            } else {
                cell.awayScoreLabel.isHidden = true
                cell.homeScoreLabel.isHidden = true
            }
        case .placeholderMatchBothUnknown(let placeholderMatchBothUnknown):
            cell.dateLabel.text          = Utils.formatDateMedium(date: placeholderMatchBothUnknown.date)
            cell.placeLabel.text         = placeholderMatchBothUnknown.stadium.name
            cell.groupLabel.text         = placeholderMatchBothUnknown.type
            cell.homeTeamLabel.text      = placeholderMatchBothUnknown.homeTeam
            cell.awayTeamLabel.text      = placeholderMatchBothUnknown.awayTeam
            cell.homeTeamImageView.isHidden = true
            cell.awayTeamImageView.isHidden = true

        
        case .placeholderMatchHomeKnown(let placeholderMatchHomeKnown):
            cell.dateLabel.text          = Utils.formatDateMedium(date: placeholderMatchHomeKnown.date)
            cell.placeLabel.text         = placeholderMatchHomeKnown.stadium.name
            cell.groupLabel.text         = placeholderMatchHomeKnown.type
            cell.homeTeamLabel.text      = placeholderMatchHomeKnown.homeTeam.name
            cell.awayTeamLabel.text      = placeholderMatchHomeKnown.awayTeam
            cell.homeTeamImageView.isHidden = true
            cell.awayTeamImageView.isHidden = false
        
        case .placeholderMatchAwayKnown(let placeholderMatchAwayKnown):
            cell.dateLabel.text          = Utils.formatDateMedium(date: placeholderMatchAwayKnown.date)
            cell.placeLabel.text         = placeholderMatchAwayKnown.stadium.name
            cell.groupLabel.text         = placeholderMatchAwayKnown.type
            cell.homeTeamLabel.text      = placeholderMatchAwayKnown.homeTeam
            cell.awayTeamLabel.text      = placeholderMatchAwayKnown.awayTeam.name
            cell.homeTeamImageView.isHidden = false
            cell.awayTeamImageView.isHidden = true
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //if indexPath.row == 2{return}
        performSegue(withIdentifier: "showDetails", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        if identifier == "showDetails" {
            let match         = matches[(tableView.indexPathForSelectedRow?.row)!]
            let destination   = segue.destination as! MatchViewController
            destination.match = match
        }
    }
    
}

