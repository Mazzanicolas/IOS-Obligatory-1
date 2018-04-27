//
//  MatchViewController.swift
//  Obligatorio_1
//
//  Created by SP19 on 19/4/18.
//  Copyright © 2018 UCU. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var match : Match!
    var selectedCountryTeam:              CountryTeam?
    @IBOutlet weak var eventsTableView:   UITableView!
    @IBOutlet weak var stadiumImageView:  UIImageView!
    @IBOutlet weak var homeTeamImageView: UIImageView!
    @IBOutlet weak var awayTeamImageView: UIImageView!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var stadiumNameLabel:  UILabel!
    @IBOutlet weak var dateLabel:         UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsTableView.delegate   = self
        eventsTableView.dataSource = self
        
        let tapAwayTeam = UITapGestureRecognizer(target: self, action: #selector(showAwayCountryDetails))
        awayTeamImageView.addGestureRecognizer(tapAwayTeam)
        awayTeamImageView.isUserInteractionEnabled = true
        
        let tapHomeTeam = UITapGestureRecognizer(target: self, action: #selector(showHomeCountryDetails))
        homeTeamImageView.addGestureRecognizer(tapHomeTeam)
        homeTeamImageView.isUserInteractionEnabled = true
        
        title = match.homeTeam.name+" vs "+match.awayTeam.name
        stadiumImageView.image  = match.stadium.logo
        stadiumNameLabel.text   = match.stadium.name
        homeTeamImageView.image = match.homeTeam.logo
        awayTeamImageView.image = match.awayTeam.logo
        homeTeamNameLabel.text  = match.homeTeam.name
        awayTeamNameLabel.text  = match.awayTeam.name
        dateLabel.text          = Utils.formatDate(date: match.date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return match.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCellId", for: indexPath) as! EventTableViewCell
        let event = match.events[indexPath.row]
        
        cell.eventTime.text = String(event.time)+"'"
        
        return cell
    }

    @objc
    func showAwayCountryDetails(){
        selectedCountryTeam = match.awayTeam
        performSegue(withIdentifier: "countryDetails", sender: nil)
    }
    
    @objc
    func showHomeCountryDetails(){
        selectedCountryTeam = match.homeTeam
        performSegue(withIdentifier: "countryDetails", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "countryDetails" {
            let countryDetails = segue.destination as! CountryTeamViewController
            guard let countryTeam = selectedCountryTeam else{return}
            countryDetails.country = countryTeam
        }
    }
    
  
}
