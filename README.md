Original App Design Project - README Template
===


[![hackmd-github-sync-badge](https://hackmd.io/Gh3cJnI0T4Whz2CF16qFxQ/badge)](https://hackmd.io/Gh3cJnI0T4Whz2CF16qFxQ)

# WWERapp

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
WWERApp allows you to view information about consoles and video games such as avaliability and prices by taking API data from alerts by social media accounts and other existing game information websites.
### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Game
- **Mobile:** IOS 15
- **Story:** sign in and use the homepage to find to find games and consoles. Also give you an description.
- **Market:** Gamers
- **Habit:** finding information about games and consoles
- **Scope:** 16 - 35 years

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x]  User can view starting screen with logo and sign in options
- [x] User can Sign in or sign up to your account to access the app
- [x] Each account stores your filters and app settings
- [x] The app searches for information from twitter alert acounts and other social media API
- [ ] The app displays information taken from social media depending on your filter preferences such as consoles and game genres
- [ ] App displays the console and game information and picture on the home page
- [ ] Home page has search bar to look for specific products
- [ ] Can click products from Home page to go to the Product Information page which shows more detailed info about the pricing and avaliability
- [ ] Filter menus for selecting what types of games, genres, or consoles you are interested in viewing information for
- [ ] User can access their profile to change their information and app settings
- [ ] ...

**Optional Nice-to-have Stories**

- [x] filters for location and price
- [ ] When selecting the product information, have links to the product on websites like Amazon and Gamestop
- [ ] Settings menu to change app colors and UI
- [ ] ...

### 2. Screen Archetypes

* Sign In
   * User can log in or sign up
* Home Page (Stream)
   * User can view feed of product information for consoles and games based on filter preferences
   * User can use search bar to look up specific products
* Product Info
   * User can view detailed product information such as pricing, avaliability, description, and locations
   * User can click links to purchase products from sources such as Amazon or Gamestop
* Filters Menu
   * User can adjust feed information data by selecting options such as Brand, Product Type, and Game Genre
* User Settings
   * User can log out
   * User can view their account information
   * User can update their name, email, zip code
   * User can change from light mode and dark mode
### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home Feed
* Filters Tab
* User Settings

**Flow Navigation** (Screen to Screen)

* Login Screen
   * => Home Feed
* Registration Screen
   * => Home Feed
* Home Feed
   * => Detailed product view
   * => Links to find product listings for purchase
   * => User settings page
* Filters
   * => None
* User Settings
   * => Change profile picture

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="https://user-images.githubusercontent.com/88115439/138010410-5b9410b6-84ce-4f87-bd67-b9856dbcb6b6.png" width=600>

<img src="https://user-images.githubusercontent.com/23386463/138615807-5ab6bb80-831c-4754-bf58-f4d94664a26f.png" width=600>

![ezgif com-gif-maker](https://user-images.githubusercontent.com/88115439/138615957-21f42af0-fcb6-44c1-8945-5033657436e4.gif)


## Schema 

### Models

| Property | Type     | Description |
| -------- | -------- | --------    |
| image    | File     | Image that user posts|
| userName | String   | Name of user account |
| like     | Number   | Number of likes in a specific post|
| objectId | String   | Unique id for the user post (default field)|
| password |String    | Password of a specific userName |
| description |String |Description of the product posted |
| price    |  Number  | Price of items  |
| author | String | Creator of the post |


### Networking

* Signin Screen
    * (Read/Get) User login

```
@IBAction func signInButton(_ sender: Any) {
        let username = userNameField.text!
        let password = passwordField.text!
        PFUser.logInWithUsername(inBackground: username, password: password){
            (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("Error: \(error?.localizedDescription)")
            }
        }
    }  
```

* 
    * (Read/Get) User SignUp


 ```
@IBAction func signUpButton(_ sender: Any) {
        let user = PFUser()
        user.username = userNameField.text
        user.password = passwordField.text
        user.signUpInBackground{(success, error)in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
```
        
        
     
* Home Screen
    * (Update/PUT) Images of products in screen

func tableView(_ tableView: UITableView , numberofRowsinSection section: Int) -> Int {
let post = posts[section]
return post
}

tableView.reloadData()

    * (Create/POST) Create a new comment
    
@IBAction func onSubmitButton(_ sender: Any) {
        let post = PFObject(className: "Posts")
        
post["caption"] = commentField.text!
post["auther"] = PFUser.current()!
       
let imageData = imageView.image!.pngData()
let file = PFFileObject(name: "image.png", data: imageData!)
        post["image"] = file
        post.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("saved!")
            } else {
                print("error")
            }
        }
    }    
    
* Product Information Screen
    * (Create/POST) create a new like
        let like = PFObject(classname: "like")
        like["user"] = PFUser.current()
        like["post"] = post
        
        post.add(like, forKey: "likes")
        
        post.saveInBackground(){
            (success, error) in
            if success {
                print("like saved")
            }
            else {
                print("error saving like")
            }
        }
    * (Delete) Delete existing like
        let currentUser = PFUser.current()
        let query = PFQuery(classname: "like")
        query.whereKey("user", equalTo: currentUser)
        query.whereKey("post", equalTo: post)
        query.findObjectsInBackground { (like: [PFObject]?, error: Error?) in
            if let error = error { 
                print(error.localizedDescription)
            } else if let posts = posts {
                print("Successfully retrieved the like")
                like.deleteInBackground(){
                    (success, error) in
                    if success {
                        print("like deleted")
                    }
                    else {
                        print("error deleting like")
                    }
                }
                post.saveInBackground(){
                    (success, error) in
                    if success {
                        print("post saved")
                    }
                    else {
                        print("error saving post")
                    }
                }
             }
        }

* 
    * (Read/GET) Get the price    
```
let post = posts[indexPath.row]
let price = post["price"] as! Double 
```

* (Update/PUT) Put image of product 
```
let post = posts[indexPath.row]
let image = post["image"]
```
* User settings Screen
    * (Read/GET) Name

```
let user = PFUser.current()
let name = user.username
```    

* (Read/GET) Email address
    
```
let user = PFUser.current()
let email = user.email
```

* (Read/GET) Zip Code

```
let user = PFUser.current()
let zipCode = user["zipcode"] as! Int
```

- [Create basic snippets for each Parse network request]

![ezgif com-gif-maker (2)](https://user-images.githubusercontent.com/88115439/140846257-bb8dd58d-4d07-431d-9098-0c8fc0044267.gif)

![ezg![ezgif com-gif-maker (2)](https://user-images.githubusercontent.com/88115439/141884974-b00d08b5-4a2a-4bcf-afc0-fffe9a7f9f80.gif)

![ezgif com-gif-maker (2)](https://user-images.githubusercontent.com/88115439/141885012-e5b305e6-c1ff-40c6-a84a-1ca6b9f9bc9b.gif)


![ezgif com-gif-maker (2)](https://user-images.githubusercontent.com/88115439/143158808-5cb7ab04-66a5-4400-875e-2b3843581304.gif)






