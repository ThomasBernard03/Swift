//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        title = K.appName
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func LogoutPressed(_ sender: UIBarButtonItem) {
        
        let firebaseAuth = Auth.auth()
        do {
            
            try firebaseAuth.signOut()
            navigationController?.popViewController(animated: true)
            
        }
        catch let sigoutError as NSError {
            print(sigoutError)
        }
        
    }
    
}
