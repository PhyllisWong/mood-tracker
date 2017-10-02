//
//  ListFriendsTableViewController.swift
//  Mood Tracker
//
//  Created by djchai on 9/29/17.
//  Copyright © 2017 djchai. All rights reserved.
//

import UIKit

struct Friend {
    let name: String
    var mood: Mood?
}

enum Mood: String {
    case happy = "😀"
    case neutral = "😐"
    case sad = "🙁"
    case angry = "😡"
}

class ListFriendsTableViewController: UITableViewController {
    //func didSelectFriend(friend: Friend) {
        //self.selectedFriend = friend
    //}
    

    var friends: [Friend] = [
        Friend(name: "Ross", mood: nil),
        Friend(name: "Rachel", mood: nil),
        Friend(name: "Monica", mood: nil),
        Friend(name: "Chandler", mood: nil),
        Friend(name: "Pheobe", mood: nil),
        Friend(name: "Joey", mood: nil)
        
    ]
    
    @IBOutlet var guessedFriend: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    // button to select friend
    @IBAction func SelectFriend(_ sender: Any) {
        // when pressed, goes to the moods view controller
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath)

        let friend = friends[indexPath.row]
        
        
        cell.textLabel?.text = "\(friend.name) \(friend.mood?.rawValue ?? "")"

        return cell
    }
    
    @IBAction func addPressed(_ sender: Any) {
        
        // Add your friend here
    }
    
    // Tableview delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedFriend = friends[indexPath.row]
        
        goToMoodChooserViewController(selectedFriend: selectedFriend)
        
    }
    
    func goToMoodChooserViewController(selectedFriend: Friend) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let chooseMoodTableViewController = storyboard.instantiateViewController(withIdentifier: "ChooseMoodTableViewController") as? ChooseMoodTableViewController
            else {return}
        
        
        chooseMoodTableViewController.selectedFriend = selectedFriend
        
        // TODO: Make sure to set the delegate on the ChooseMoodTableViewController
     
        
    self.navigationController?.pushViewController(chooseMoodTableViewController, animated: true)
        
    }
    
    
    @IBAction func addNewFriend(_ sender: Any) {
        
    }
    
    @IBAction func didPressFriend(_ sender: Any) {
        
        chooseMoodTableViewController()
    }
    
}
