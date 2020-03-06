//
//  ViewController.swift
//  AppChatSimple
//
//  Created by Nguyen Duy anh on 3/6/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editElement()
    }
    
    func editElement() {
        Utilities.styleFilledButton(loginButton)
        Utilities.styleHollowButton(registerButton)
    }

}

