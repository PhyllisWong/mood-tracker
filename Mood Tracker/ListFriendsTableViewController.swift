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

class ListFriendsTableViewController: UITableViewController, FriendSelectorDelegate, DataSentDelegate {

    var friends: [Friend] = [
        Friend(name: "Ross", mood: nil),
        Friend(name: "Rachel", mood: nil)
    ]
    // Instantiate new friend, store String as Friend.name
    func userDidEnterData(data: String) {
        let newFriend = Friend(name: data, mood: nil)
        friends.append(newFriend)
        tableView.reloadData()
        print(friends)
    }
    
    
    func didSelectFriend(friend: Friend, indexPath: IndexPath) {
        guard let mood = friend.mood else {return}
        friends[selectedFriend].mood = mood
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAddFriendVC" {
            let addFriendVC: AddFriendVC = segue.destination as! AddFriendVC
            addFriendVC.delegate = self
        }
    }
    
    
    @IBOutlet var guessedFriend: UITableView!
    var  selectedFriend: Int!
    
    // button to select friend
    // when pressed, goes to the moods view controller
    
    
   
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

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath)
        let friend = friends[indexPath.row]
        cell.textLabel?.text = "\(friend.name) \(friend.mood?.rawValue ?? "")"
        return cell
    }
    
    // Tableview delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFriend = friends[indexPath.row]
        let selectedRow = indexPath.row
        goToMoodChooserViewController(selectedFriend: selectedFriend, selectedRow: selectedRow)
        
    }
    
    func goToMoodChooserViewController(selectedFriend: Friend, selectedRow: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let chooseMoodTableViewController = storyboard.instantiateViewController(withIdentifier: "ChooseMoodTableViewController") as? ChooseMoodTableViewController
            else {return}
        self.selectedFriend = selectedRow
        
        chooseMoodTableViewController.selectedFriend = selectedFriend
        chooseMoodTableViewController.selectedRow = selectedRow
        chooseMoodTableViewController.delegate = self 
        
        // TODO: Make sure to set the delegate on the ChooseMoodTableViewController

    self.navigationController?.pushViewController(chooseMoodTableViewController, animated: true)
        
    }
    
    

    
}
