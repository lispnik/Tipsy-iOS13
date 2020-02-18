//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Matthew Kennedy on 2/17/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var brain: CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", brain!.computeTip()!)
        settingsLabel.text = String(format: "Split between %.0f people, with %.0f%% tip", brain!.split, brain!.percentage * 100)
    }
    
}
