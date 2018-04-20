//
//  MatchViewController.swift
//  Obligatorio_1
//
//  Created by SP19 on 19/4/18.
//  Copyright © 2018 UCU. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var eventsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsTableView.delegate   = self
        eventsTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
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
    


}
