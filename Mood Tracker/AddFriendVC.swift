//
//  AddFriendVC.swift
//  Mood Tracker
//
//  Created by djchai on 10/3/17.
//  Copyright © 2017 djchai. All rights reserved.
//

import UIKit

protocol DataSentDelegate {
    func userDidEnterData(data: String)
}

class AddFriendVC: UIViewController {
    
    var delegate: DataSentDelegate? = nil

    @IBOutlet weak var addFriendTF: UITextField!
    
    @IBAction func didPressSend(_ sender: Any) {
        guard let data = addFriendTF.text else {return}
        delegate?.userDidEnterData(data: data)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
