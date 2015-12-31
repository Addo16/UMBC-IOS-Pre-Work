//
//  SettingsViewController.swift
//  tips
//
//  Created by Percy Addo on 12/11/15.
//  Copyright © 2015 InSource. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
   
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
   
    @IBOutlet weak var tipDefault: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
  
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be   recreated.
    }
  
    @IBAction func onEditDefaultTip(sender: UISegmentedControl) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(sender.selectedSegmentIndex, forKey: "default_tip")
        defaults.synchronize()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipDefault = defaults.integerForKey("default_tip")
        print("got default tip: \(tipDefault)")
        switch tipDefault {
        case 0...2:
            defaultTipControl.selectedSegmentIndex = tipDefault
        default:
            defaultTipControl.selectedSegmentIndex = 0
            
            defaults.synchronize()
        }
    }

  
/*

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
*/


}
