//
//  SettingViewController.swift
//  PreWork
//
//  Created by Tiffany on 8/7/21.
//

import UIKit


class SettingViewController: UIViewController {
    @IBOutlet weak var tip1Text: UITextField!
    @IBOutlet weak var tip2Text: UITextField!
    @IBOutlet weak var tip3Text: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        tip1Text.text = String(UserDefaults.standard.object(forKey: "tip1") as! Int)
        tip2Text.text = String(UserDefaults.standard.object(forKey: "tip2") as! Int)
        tip3Text.text = String(UserDefaults.standard.object(forKey: "tip3") as! Int)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tip1Change(_ sender: Any) {
        let tip1toInt = Int(tip1Text.text!)
        UserDefaults.standard.set(tip1toInt, forKey: "tip1")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func tip2Change(_ sender: Any) {
        let tip2toInt = Int(tip2Text.text!)
        UserDefaults.standard.set(tip2toInt, forKey: "tip2")
    }
    
    @IBAction func tip3Change(_ sender: Any) {
        let tip3toInt = Int(tip3Text.text!)
        UserDefaults.standard.set(tip3toInt, forKey: "tip3")
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
