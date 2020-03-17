//
//  ChatViewController.swift
//  AppChatSimple
//
//  Created by Nguyen Duy anh on 3/7/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTextField.layer.cornerRadius = 20
        messageTextField.clipsToBounds = true
        
        tableView.dataSource = self
        tableView.separatorStyle = .none
        title = Constants.appName
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        
        loadMessages()
    }
    
    func loadMessages() {
        db.collection(Constants.FStore.collectionName)
            .order(by: Constants.FStore.dateField)
            .addSnapshotListener { (querrySnapShot, error) in
                self.messages = []
                if let err = error {
                    print("There was an issue retrieving data from Firestores, \(err)")
                } else {
                    if let snapShotDocuments = querrySnapShot?.documents {
                        for doc in snapShotDocuments {
                            let data = doc.data()
                            if let messageSender = data[Constants.FStore.senderField] as? String,
                                let messageBody = data[Constants.FStore.bodyField] as? String {
                                let newMessage = Message(sender: messageSender, body: messageBody)
                                self.messages.append(newMessage)
                                
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                    let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                    self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                                }
                                
                            }
                        }
                    }
                }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextField.text,
            let meesageSender = Auth.auth().currentUser?.email {
            db.collection(Constants.FStore.collectionName).addDocument(data: [
                Constants.FStore.senderField: meesageSender,
                Constants.FStore.bodyField : messageBody,
                Constants.FStore.dateField: Date().timeIntervalSince1970]) { error in
                    if let err = error {
                        print("There was an issue saving data to firestore, \(err)")
                    } else {
                        //print("Succesfully saved data")
                        DispatchQueue.main.async {
                            self.messageTextField.text = ""
                        }
                    }
            }
        }
    }
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        cell.messageLabel?.text = message.body
        
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImage.isHidden = true
            cell.rightImage.isHidden = false
            //cell.massageBubble.backgroundColor = UIColor(named: Constants.textColor.lightPurple)
            cell.messageLabel.textColor = UIColor(named: Constants.textColor.cyanBlue)
        } else {
            cell.leftImage.isHidden = false
            cell.rightImage.isHidden = true
            cell.massageBubble.backgroundColor = UIColor(named: Constants.textColor.cyanBlue)
            cell.messageLabel.textColor = UIColor(named: Constants.textColor.lightPurple)
        }
        return cell
    }
    
    
}

