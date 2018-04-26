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
        
        TeamMember(name:"Roberto Carlos", temporalId: "69", countryTeam: "Rusia", club: "Un Club")
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

