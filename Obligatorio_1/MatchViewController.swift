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
    @IBOutlet weak var eventsTableView: UITableView!
    @IBOutlet weak var rightCountryImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsTableView.delegate   = self
        eventsTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        let tap = UITapGestureRecognizer(target: self, action: #selector(showCountryDetails))
        rightCountryImage.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCellId", for: indexPath)
        return cell
    }

    @objc
    func showCountryDetails(){
        performSegue(withIdentifier: "countryDetails", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "countryDetails" {
            let countryDetails = segue.destination as! CountryTeamViewController
            countryDetails
        }
    }
    
  
}
