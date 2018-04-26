//
//  CountryTeamViewController.swift
//  Obligatorio_1
//
//  Created by Admin on 23/04/2018.
//  Copyright © 2018 UCU. All rights reserved.
//

import UIKit

class CountryTeamViewController: UIViewController {

    var country: CountryTeam!
    @IBOutlet weak var countryImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = country.name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
