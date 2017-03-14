//
//  SettingsViewController.swift
//  TipProf
//
//  Created by Yavuz Altug on 3/13/17.
//  Copyright © 2017 Yavuz Altug. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var tipTextBox1: UITextField!
    @IBOutlet weak var tipTextBox2: UITextField!
    @IBOutlet weak var tipTextBox3: UITextField!
    @IBOutlet weak var roundCheckbox: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(" settings view will appear")

        let round = defaults.integer(forKey: "roundValue")
        tipTextBox1.text = String(defaults.double(forKey: "tip1"))
        tipTextBox2.text = String(defaults.double(forKey: "tip2"))
        tipTextBox3.text = String(defaults.double(forKey: "tip3"))
        roundCheckbox.selectedSegmentIndex = round
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("settings view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("settings view will disappear")
        defaults.set(Double(tipTextBox1.text!)!, forKey: "tip1")
        defaults.set(Double(tipTextBox2.text!)!, forKey: "tip2")
        defaults.set(Double(tipTextBox3.text!)!, forKey: "tip3")
        defaults.set(roundCheckbox.selectedSegmentIndex, forKey: "roundValue")
        defaults.synchronize()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("settings view did disappear")
    }

}
