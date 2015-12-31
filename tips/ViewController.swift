//
//  ViewController.swift
//  tips
//
//  Created by Percy Addo on 12/7/15.
//  Copyright © 2015 InSource. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateTip()
    }
    
    func updateTip() {
        let tipPercentages = [0.10, 0.15, 0.20]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
   
        /*
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        */
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String (format: "$%.2f", total)
        
        
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipDefault = defaults.integerForKey("default_tip")
        print("got default tip: \(tipDefault)")
        switch tipDefault {
        case 0...2:
            tipControl.selectedSegmentIndex = tipDefault
        default:
            tipControl.selectedSegmentIndex = 0
        }
        
        
        // Recalculate the tip
        updateTip()
    }
    
    }


