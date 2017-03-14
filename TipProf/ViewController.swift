//
//  ViewController.swift
//  TipProf
//
//  Created by Yavuz Altug on 3/13/17.
//  Copyright © 2017 Yavuz Altug. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipBar: UISegmentedControl!
    @IBOutlet weak var customTipTextField: UITextField!
    @IBOutlet weak var customTipType: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    private var rounds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTab(_ sender: Any) {
        
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        let defaultTips = [0.10, 0.18, 0.22, 1]
        let customTip : Double = ((Double(customTipTextField.text!) != nil) ? Double(customTipTextField.text!)! : 1.0)
        let bill = Double(billTextField.text!) ?? 0
        let tip = (customTipType.selectedSegmentIndex==0) ? bill * defaultTips[tipBar.selectedSegmentIndex] * (customTip/100) : bill + customTip
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        round = defaults.integer(forKey: "roundValue")
        tipBar.setTitle(String(defaults.double(forKey: "tip1")), forSegmentAt: 0)
        tipBar.setTitle(String(defaults.double(forKey: "tip2")), forSegmentAt: 1)
        tipBar.setTitle(String(defaults.double(forKey: "tip3")), forSegmentAt: 2)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
}

