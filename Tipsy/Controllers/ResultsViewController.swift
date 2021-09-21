//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by surafel getachew on 20/09/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var eachPersonBill = ""
    var tipAmount = "";
    var numberOfPeople = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = "\(eachPersonBill) ETB";
        settingsLabel.text = "Split between \(numberOfPeople) with \(tipAmount)% tip"
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func reCalculatePressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
