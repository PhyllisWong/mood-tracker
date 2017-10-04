//
//  ListFriendsTableViewController.swift
//  Mood Tracker
//
//  Created by djchai on 9/29/17.
//  Copyright © 2017 djchai. All rights reserved.
//

import UIKit

// constraints for the friends
struct Friend {
    let name: String
    var mood: Mood?
}

// switch cases for the different mood options
enum Mood: String {
    case happy = "😀"
    case neutral = "😐"
    case sad = "🙁"
    case angry = "😡"
    case bot = "🤖"
    case cowboy = "🤠"
    case love = "😍"
    case sick = "🤢"
    case poop = "💩"
}

/*   VC shows the list of friends
     Has the ability to add a friend
     Can click in the friend to take user to moods VC
     Conforms to 2 delegates(moods and friend added delegates)
*/
class ListFriendsTableViewController: UITableViewController, FriendSelectorDelegate, DataSentDelegate {

    var friends: [Friend] = [
        Friend(name: "Ross", mood: nil),
        Friend(name: "Rachel", mood: nil),
        Friend(name: "Monica", mood: nil),
        Friend(name: "Phoebe", mood: nil)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // Instantiate new friend, store name as data from AddFriendVC
    func userDidEnterData(data: String) {
        let newFriend = Friend(name: data, mood: nil)
        friends.append(newFriend)
        tableView.reloadData()
        //debug if addFriend worked: print(friends)
    }
    
    
    
    // stores the selected friend as an index of the friends array
    var  selectedFriend: Int!
    // if a mood was selected from the ChooseMoodVC: save which row was pressed
    // update the friend's mood state
    func didSelectFriend(friend: Friend, indexPath: IndexPath) {
        guard let mood = friend.mood else {return}
        friends[selectedFriend].mood = mood
        tableView.reloadData()
    }
    
    
    
    // allows the addFriendVC to send data back to this VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAddFriendVC" {
            let addFriendVC: AddFriendVC = segue.destination as! AddFriendVC
            addFriendVC.delegate = self
        }
    }

    

    // sets the number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    // sets the number of rows
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
    
    // sets up the moods table view as a delegate
    func goToMoodChooserViewController(selectedFriend: Friend, selectedRow: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let chooseMoodTableViewController = storyboard.instantiateViewController(withIdentifier: "ChooseMoodTableViewController") as? ChooseMoodTableViewController
            else {return}
        self.selectedFriend = selectedRow
        
        chooseMoodTableViewController.selectedFriend = selectedFriend
        chooseMoodTableViewController.selectedRow = selectedRow
        chooseMoodTableViewController.delegate = self 
        
       //Sets the delegate on the ChooseMoodTableViewController
    self.navigationController?.pushViewController(chooseMoodTableViewController, animated: true)
    }
}
