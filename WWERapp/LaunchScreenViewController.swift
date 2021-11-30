//
//  LaunchScreenViewController.swift
//  WWERapp
//
//  Created by Will Couture on 11/30/21.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
