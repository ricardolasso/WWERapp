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

    override func viewDidAppear(_ animated: Bool) {
        let mode = UserDefaults.standard.integer(forKey: "colorMode")
        if mode == 0 {
            view.overrideUserInterfaceStyle = .light
        }
        else if mode == 1{
            view.overrideUserInterfaceStyle = .dark
        }
    }
    

    @IBAction func colorModeControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            view.overrideUserInterfaceStyle = .light
        }
        else if sender.selectedSegmentIndex == 1 {
            view.overrideUserInterfaceStyle = .dark
        }
        
        UserDefaults.standard.set(sender.selectedSegmentIndex, forKey: "colorMode")
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
