Original App Design Project - README Template
===

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

* User can Sign in or sign up to your account to access the app
* Each account stores your filters and app settings
* The app searches for information from twitter alert acounts and other social media API
* The app displays information taken from social media depending on your filter preferences such as consoles and game genres
* App displays the console and game information and picture on the home page
* Home page has search bar to look for specific products
* Can click products from Home page to go to the Product Information page which shows more detailed info about the pricing and avaliability
* Filter menus for selecting what types of games, genres, or consoles you are interested in viewing information for
* User can access their profile to change their information and app settings
* ...

**Optional Nice-to-have Stories**

* filters for location and price
* When selecting the product information, have links to the product on websites like Amazon and Gamestop
* Settings menu to change app colors and UI
* ...

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
#### Post

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user post (default field) |
   | author        | Pointer to User| image author |
   | image         | File     | image that user posts |
   | caption       | String   | image caption by author |
   | commentsCount | Number   | number of comments that has been posted to an image |
   | likesCount    | Number   | number of likes for the post |
   | createdAt     | DateTime | date when post is created (default field) |
   | updatedAt     | DateTime | date when post is last updated (default field) |
### Networking
#### List of network requests by screen
   - Home Feed Screen
      - (Read/GET) Query all posts where user is author
         ```swift
         let query = PFQuery(className:"Post")
         query.whereKey("author", equalTo: currentUser)
         query.order(byDescending: "createdAt")
         query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let posts = posts {
               print("Successfully retrieved \(posts.count) posts.")
           // TODO: Do something with posts...
            }
         }
         ```
      - (Create/POST) Create a new like on a post
      - (Delete) Delete existing like
      - (Create/POST) Create a new comment on a post
      - (Delete) Delete existing comment
   - Create Post Screen
      - (Create/POST) Create a new post object
   - Profile Screen
      - (Read/GET) Query logged in user object
      - (Update/PUT) Update user profile image
#### [OPTIONAL:] Existing API Endpoints
##### An API Of Ice And Fire
- Base URL - [http://www.anapioficeandfire.com/api](http://www.anapioficeandfire.com/api)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /characters | get all characters
    `GET`    | /characters/?name=name | return specific character by name
    `GET`    | /houses   | get all houses
    `GET`    | /houses/?name=name | return specific house by name

##### Game of Thrones API
- Base URL - [https://api.got.show/api](https://api.got.show/api)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /cities | gets all cities
    `GET`    | /cities/byId/:id | gets specific city by :id
    `GET`    | /continents | gets all continents
    `GET`    | /continents/byId/:id | gets specific continent by :id
    `GET`    | /regions | gets all regions
    `GET`    | /regions/byId/:id | gets specific region by :id
    `GET`    | /characters/paths/:name | gets a character's path with a given name
