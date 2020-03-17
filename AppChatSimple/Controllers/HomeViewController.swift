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
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editElement()
        
        titleLabel.text = ""
        let titleText = Constants.appName
        var time = 0.0
        
        for char in titleText {
            Timer.scheduledTimer(withTimeInterval: time * 0.1, repeats: false) { (timer) in
                self.titleLabel.text?.append(char)
            }
            time += 1
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    func editElement() {
        Utilities.styleFilledButton(loginButton)
        Utilities.styleHollowButton(registerButton)
    }

}

