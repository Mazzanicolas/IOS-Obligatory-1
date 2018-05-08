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
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! MatchTableViewCell
        let match = matches[indexPath.row]
        cell.dateLabel.text          = Utils.formatDateMedium(date: match.date)
        cell.placeLabel.text         = match.stadium.name
        cell.groupLabel.text         = match.type
        cell.homeTeamLabel.text      = match.homeTeam.name
        cell.homeTeamImageView.image = UIImage(named:match.homeTeam.logoName)
        cell.awayTeamLabel.text      = match.awayTeam.name
        cell.awayTeamImageView.image = UIImage(named:match.awayTeam.logoName)
        if let awayScore = match.awayScore, let homeScore = match.homeScore {
            cell.awayScoreLabel.text     = String(awayScore)+" -"
            cell.homeScoreLabel.text     = "- "+String(homeScore)
        } else {
            cell.awayScoreLabel.isHidden = true
            cell.homeScoreLabel.isHidden = true
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
        guard let identifier = segue.identifier else {return}
        if(identifier == "showDetails"){
            let match = matches[(tableView.indexPathForSelectedRow?.row)!]
            let destination = segue.destination as! MatchViewController
            destination.match = match
        } else {
            return
        }
    }
}

