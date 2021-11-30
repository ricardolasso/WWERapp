//
//  HomeTableViewController.swift
//  WWERapp
//
//  Created by Ezekiel Faulknor on 11/16/21.
//

import UIKit

class HomeTableViewController: UITableViewController {

    var tweetArray = [NSDictionary]()
    var numberOfTweet: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTweet()
        self.tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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

    func loadTweet(){
        
        let myUrl = "https://api.twitter.com/1.1/search/tweets.json" 
        let myParams = ["count": 20]
        
        
        TwitterAPICaller.client?.getDictionariesRequest(url: myUrl, parameters: myParams, success: { (tweet: [NSDictionary]) in
            
            self.tweetArray.removeAll()
            for tweet in tweet {
                
                self.tweetArray.append(tweet)
                
            }
            
            self.tableView.reloadData()
            
        }, failure: { (Error) in
            print("Could not retreive tweet! oh no!!")
        })
        
    }
    
    // log in Button for PS5, xbox, nintendo here
    // log in Button for PS5, xbox, nintendo here
    // log in Button for PS5, xbox, nintendo here
    // log in Button for PS5, xbox, nintendo here
    // log in Button for PS5, xbox, nintendo here
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell") as! TweetCellTableViewCell
        
        cell.userNameLabel.text = "Some name"
        cell.tweetContent.text = tweetArray[indexPath.row]["text"] as? String
        
        return cell
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tweetArray.count
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
