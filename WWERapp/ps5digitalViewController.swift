//
//  ps5digitalViewController.swift
//  WWERapp
//
//  Created by user203102 on 11/30/21.
//

import UIKit

class ps5digitalViewController: UIViewController {

    @IBOutlet weak var UITextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextView()
        // Do any additional setup after loading the view.
    }
    
    func updateTextView() {
        let path = "https://walmart.com"
        let text = UITextView.text ?? ""
        let attributedString = NSAttributedString.makeHyperlink(for: path, in: text, as: "walmart")
        UITextView.attributedText = attributedString
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
