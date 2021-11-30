//
//  SettingsViewController.swift
//  WWERapp
//
//  Created by Will Couture on 11/29/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var colorModeControl: UISegmentedControl!
    @IBOutlet var control: UISegmentedControl?
    override func viewDidLoad() {
        super.viewDidLoad()
    
        control?.overrideUserInterfaceStyle = .dark
    }
    

    @IBAction func colorModeControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            view.overrideUserInterfaceStyle = .light
        }
        else if sender.selectedSegmentIndex == 1 {
            view.overrideUserInterfaceStyle = .dark
        }
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
