//
//  ChooseMoodTableViewController.swift
//  Mood Tracker
//
//  Created by djchai on 9/29/17.
//  Copyright © 2017 djchai. All rights reserved.
//

import UIKit

protocol FriendSelectorDelegate: class {
    func didSelectFriend(friend: Friend, indexPath: IndexPath)
}

class ChooseMoodTableViewController: UITableViewController {

    let moods: [Mood] = [
        .happy,
        .neutral,
        .sad,
        .angry
    ]
    
    var selectedFriend: Friend?
    var selectedRow: Int?
    weak var delegate: FriendSelectorDelegate? = nil
    
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
        return moods.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moodsCell", for: indexPath)
        cell.textLabel?.text = moods[indexPath.row].rawValue
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMood = moods[indexPath.row]
        guard var selectedFriend = selectedFriend else {return}
        selectedFriend.mood = selectedMood
        delegate?.didSelectFriend(friend: selectedFriend, indexPath: indexPath)
        navigationController?.popToRootViewController(animated: true)
    }
}
