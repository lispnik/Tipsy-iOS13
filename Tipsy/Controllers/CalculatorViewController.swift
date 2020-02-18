//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var brain = CalculatorBrain(percentage: 0.1, split: 2.0, bill: 0.0)
    
    @IBAction func tipChanged(_ sender: UIButton) {
        for button in [zeroPercentButton, tenPercentButton, twentyPercentButton] {
            button?.isSelected = false
        }
        sender.isSelected = true
        brain.percentage = Float(sender.currentTitle!.dropLast())! / 100.0
        
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        brain.split = Float(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        print(brain.percentage)
        print(brain.split)
        if let bill = Float(billTextField!.text!) {
            brain.bill = bill
            performSegue(withIdentifier: "gotoResults", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tenPercentButton.isSelected = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoResults" {
            let destination = segue.destination as! ResultsViewController
            destination.brain = brain
        }
    }
}

