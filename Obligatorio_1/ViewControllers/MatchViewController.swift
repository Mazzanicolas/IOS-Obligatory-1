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
        
        guard let match = match else { return }
        switch match {
        case .actualMatch(let actualMatch):
            title = actualMatch.homeTeam.name+" vs "+actualMatch.awayTeam.name
            stadiumImageView.image  = UIImage(named: actualMatch.stadium.imageURL)
            stadiumNameLabel.text   = actualMatch.stadium.name
            homeTeamImageView.image = UIImage(named:actualMatch.homeTeam.logoName)
            awayTeamImageView.image = UIImage(named:actualMatch.awayTeam.logoName)
            homeTeamNameLabel.text  = actualMatch.homeTeam.name
            awayTeamNameLabel.text  = actualMatch.awayTeam.name
            dateLabel.text          = Utils.formatDateMedium(date: actualMatch.date)
            
        case .placeholderMatchBothUnknown(let placeholderMatchBothUnknown):
            title = placeholderMatchBothUnknown.homeTeam+" vs "+placeholderMatchBothUnknown.awayTeam
            stadiumImageView.image  = UIImage(named: placeholderMatchBothUnknown.stadium.imageURL)
            stadiumNameLabel.text   = placeholderMatchBothUnknown.stadium.name
            homeTeamImageView.image = #imageLiteral(resourceName: "plaholderImage")
            awayTeamImageView.image = #imageLiteral(resourceName: "plaholderImage")
            homeTeamNameLabel.text  = placeholderMatchBothUnknown.homeTeam
            awayTeamNameLabel.text  = placeholderMatchBothUnknown.awayTeam
            dateLabel.text          = Utils.formatDateMedium(date: placeholderMatchBothUnknown.date)
            
            
        case .placeholderMatchHomeKnown(let placeholderMatchHomeKnown):
            title = placeholderMatchHomeKnown.homeTeam.name+" vs "+placeholderMatchHomeKnown.awayTeam
            stadiumImageView.image  = UIImage(named: placeholderMatchHomeKnown.stadium.imageURL)
            stadiumNameLabel.text   = placeholderMatchHomeKnown.stadium.name
            homeTeamImageView.image = UIImage(named:placeholderMatchHomeKnown.homeTeam.logoName)
            awayTeamImageView.image = #imageLiteral(resourceName: "plaholderImage")
            homeTeamNameLabel.text  = placeholderMatchHomeKnown.homeTeam.name
            awayTeamNameLabel.text  = placeholderMatchHomeKnown.awayTeam
            dateLabel.text          = Utils.formatDateMedium(date: placeholderMatchHomeKnown.date)
            
        case .placeholderMatchAwayKnown(let placeholderMatchAwayKnown):
            title = placeholderMatchAwayKnown.homeTeam+" vs "+placeholderMatchAwayKnown.awayTeam.name
            stadiumImageView.image  = UIImage(named: placeholderMatchAwayKnown.stadium.imageURL)
            stadiumNameLabel.text   = placeholderMatchAwayKnown.stadium.name
            homeTeamImageView.image = #imageLiteral(resourceName: "plaholderImage")
            awayTeamImageView.image = #imageLiteral(resourceName: "plaholderImage")
            homeTeamNameLabel.text  = placeholderMatchAwayKnown.homeTeam
            awayTeamNameLabel.text  = placeholderMatchAwayKnown.awayTeam.name
            dateLabel.text          = Utils.formatDateMedium(date: placeholderMatchAwayKnown.date)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let match = match else {return 0}
        switch match {
        case .actualMatch(let actualMatch):
            return actualMatch.events.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let match = match else { let cell  = tableView.dequeueReusableCell(withIdentifier: "eventCellId", for: indexPath) as! EventTableViewCell
            return cell }
        switch match {
        case .actualMatch(let actualMatch):
            let cell  = tableView.dequeueReusableCell(withIdentifier: "eventCellId", for: indexPath) as! EventTableViewCell
            let event = actualMatch.events[indexPath.row]
            if event.eventShownOn == "Right" {
                cell.rightEmoji.text       = event.emoji
                cell.rightDescription.text = event.eventDescription
                cell.leftEmoji.text        = ""
                cell.leftDescription.text  = ""
            } else {
                cell.rightEmoji.text       = ""
                cell.rightDescription.text = ""
                cell.leftEmoji.text        = event.emoji
                cell.leftDescription.text  = event.eventDescription
            }
            cell.eventTime.text = String(event.time)+"'"
            return cell
        default:
            let cell  = tableView.dequeueReusableCell(withIdentifier: "eventCellId", for: indexPath) as! EventTableViewCell
            return cell
        }
    }

    @objc
    func showAwayCountryDetails(){
        guard let match = match else { return }
        switch match {
        case .actualMatch(let actualMatch):
            selectedCountryTeam = actualMatch.awayTeam
            performSegue(withIdentifier: "countryDetails", sender: nil)
        case .placeholderMatchAwayKnown(let placeholderMatchAwayKnown):
            selectedCountryTeam = placeholderMatchAwayKnown.awayTeam
            performSegue(withIdentifier: "countryDetails", sender: nil)
        default:
            selectedCountryTeam = nil
        }
    }
    
    @objc
    func showHomeCountryDetails(){
        guard let match = match else { return }
        switch match {
        case .actualMatch(let actualMatch):
            selectedCountryTeam = actualMatch.homeTeam
            performSegue(withIdentifier: "countryDetails", sender: nil)
        case .placeholderMatchHomeKnown(let placeholderMatchHomeKnown):
            selectedCountryTeam = placeholderMatchHomeKnown.homeTeam
            performSegue(withIdentifier: "countryDetails", sender: nil)
        default:
            selectedCountryTeam = nil
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "countryDetails" {
            let countryDetails     = segue.destination as! CountryTeamViewController
            guard let countryTeam  = selectedCountryTeam else { return }
            countryDetails.country = countryTeam
        }
    }
        
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if(selectedCountryTeam == nil){
            return false
        }
        return true
    }
  
}
