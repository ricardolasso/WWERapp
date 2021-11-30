//
//  LoginViewController.swift
//  WWERapp
//
//  Created by Will Couture on 11/8/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: "loggedIn") {
            let username = UserDefaults.standard.string(forKey: "username")!
            let password = UserDefaults.standard.string(forKey: "password")!
            PFUser.logInWithUsername(inBackground: username, password: password){
                (user, error) in
                if user != nil {
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else{
                    print("Error: \(error?.localizedDescription)")
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        let mode = UserDefaults.standard.integer(forKey: "colorMode")
        if mode == 0 {
            view.overrideUserInterfaceStyle = .light
        }
        else if mode == 1 {
            view.overrideUserInterfaceStyle = .dark
        }
    }
    
    @IBAction func onLogin(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        PFUser.logInWithUsername(inBackground: username, password: password){
            (user, error) in
            if user != nil {
                // Authenticate Twitter
                let myURL = "https://api.twitter.com/oauth/request_token"
                TwitterAPICaller.client?.login(url: myURL, success: {
                    
                    // Save login info
                    UserDefaults.standard.set(true, forKey: "loggedIn")
                    UserDefaults.standard.set(username, forKey: "username")
                    UserDefaults.standard.set(password, forKey: "password")
                    self.usernameField.text = ""
                    self.passwordField.text = ""
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    
                }, failure:{ (Error) in
                    print("Invalid Login")
                    
                })
                
            } else{
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    
    @IBAction func onSignInDebug(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        PFUser.logInWithUsername(inBackground: username, password: password){
            (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else{
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text!
        user.password = passwordField.text!
        user.signUpInBackground(){
            (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("Error: \(error?.localizedDescription)")
            }
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
