//
//  ViewController.swift
//  TipProf
//
//  Created by Yavuz Altug on 3/13/17.
//  Copyright © 2017 Yavuz Altug. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipBar: UISegmentedControl!
    @IBOutlet weak var customTipTextField: UITextField!
    @IBOutlet weak var customTipType: UISegmentedControl!
    @IBOutlet weak var roundInfo: UILabel!
    @IBOutlet weak var tatalView: UIView!
    
    let defaults = UserDefaults.standard
    
    var defaultTips = [0.10, 0.18, 0.22, 1]
    
    private var round = 0
    
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
        
        tatalView.isHidden = false
        let customTip : Double = ((Double(customTipTextField.text!) != nil) ? Double(customTipTextField.text!)! : 1.0)
        let bill = Double(billTextField.text!) ?? 0
        var tip = 0.0
        if(tipBar.selectedSegmentIndex==3){
            customTipType.isHidden = false
            customTipTextField.isHidden = false
            if(customTipType.selectedSegmentIndex==0){
            
                tip = bill * (customTip/100)
            
            }else{
            
                tip = customTip
            
            }
        }else{
        
            tip = bill * defaultTips[tipBar.selectedSegmentIndex]
            
        }

        var total : Double = 0
        
        if(round==0){
            total = bill + tip
            roundInfo.text = "Value is not rounded"
        }else if(round == 1){
            total = ceil(bill+tip)
            roundInfo.text = "Value is rounded up"
        }else{
            total = floor(bill+tip)
            roundInfo.text = "Value is rounded down"
        }
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        round = defaults.integer(forKey: "roundValue")
        if(defaults.double(forKey: "tip1") != 0.0){
            tipBar.setTitle(String(format: "$%.0f", defaults.double(forKey: "tip1"))+"%", forSegmentAt: 0)
            defaultTips[0] = defaults.double(forKey: "tip1")/100
        }
        if(defaults.double(forKey: "tip2") != 0.0){
            tipBar.setTitle(String(format: "$%.0f", defaults.double(forKey: "tip2"))+"%", forSegmentAt: 1)
            defaultTips[1] = defaults.double(forKey: "tip2")/100
        }
        if(defaults.double(forKey: "tip3") != 0.0){
            tipBar.setTitle(String(format: "$%.0f", defaults.double(forKey: "tip3"))+"%", forSegmentAt: 2)
            defaultTips[2] = defaults.double(forKey: "tip3")/100
        }
        tatalView.isHidden = true
        customTipType.isHidden = true
        customTipTextField.isHidden = true
        billTextField.text = ""

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

