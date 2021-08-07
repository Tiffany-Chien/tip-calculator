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
        calculateTipFunction()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // over the maximum will return to min
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 12
        calculateTipFunction();
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tip1Title = String(UserDefaults.standard.object(forKey: "tip1") as! Int) + "%";
        let tip2Title = String(UserDefaults.standard.object(forKey: "tip2") as! Int) + "%";
        let tip3Title = String(UserDefaults.standard.object(forKey: "tip3") as! Int) + "%";
        tipControl.setTitle(tip1Title, forSegmentAt: 0);
        tipControl.setTitle(tip2Title, forSegmentAt: 1)
        tipControl.setTitle(tip3Title, forSegmentAt: 2)
        calculateTipFunction();
    }
    
    func calculateTipFunction() {
        // get the bill amount from the text field
        let bill = Double(billAmountTextField.text!) ?? 0
        // calculate the cost
        // tip percentage
        
        let tip1 = UserDefaults.standard.object(forKey: "tip1") as! Double
        let tip2 = UserDefaults.standard.object(forKey: "tip2") as! Double
        let tip3 = UserDefaults.standard.object(forKey: "tip3") as! Double
        let tipPercentage = [tip1 * 0.01, tip2 * 0.01, tip3 * 0.01]
        
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

    @IBAction func calculateTip(_ sender: Any) {
        calculateTipFunction();
    }

}

