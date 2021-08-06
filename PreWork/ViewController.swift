//
//  ViewController.swift
//  PreWork
//
//  Created by Tiffany on 8/5/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var tipEachPerson: UILabel!
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        valueLabel.text = Int(sender.value).description
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // over the maximum will return to min
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 12
    }

    @IBAction func calculateTip(_ sender: Any) {
        // get the bill amount from the text field
        let bill = Double(billAmountTextField.text!) ?? 0
        // calculate the cost
        // tip percentage
        let tipPercentage = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        // calculate tip each person
        let partySize = Double(valueLabel.text!) ?? 1
        let totalDivdePartySize = (Double(bill / partySize)) * (1 + tipPercentage[tipControl.selectedSegmentIndex])
        tipEachPerson.text = String(format: "$%.2f", totalDivdePartySize)
        
        // Update the tip and total label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update the total amount
        totalLabel.text = String(format: "$%.2f", total)
    
    }
    
}

