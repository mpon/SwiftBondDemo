//
//  ViewController.swift
//  SwiftBondDemo
//
//  Created by Masato OSHIMA on 2015/02/04.
//  Copyright (c) 2015年 Masato OSHIMA. All rights reserved.
//

import UIKit
import Bond

class ViewController: UIViewController {
    
    @IBOutlet weak private var usernameField: UITextField!
    @IBOutlet weak private var emailField: UITextField!
    @IBOutlet weak private var passwordField: UITextField!
    @IBOutlet weak private var passwordConfirmField: UITextField!
    @IBOutlet weak private var errorLabel: UILabel!
    @IBOutlet weak private var createButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ============= rule1 =============
        let rule1a = reduce(usernameField, emailField, false) {
            !($0.isEmpty || $1.isEmpty)
        }
        let rule1b = reduce(passwordField, passwordConfirmField, false) {
            $0 == $1
        }
        let rule1c = passwordField.map { countElements($0) >= 8 }
        reduce(rule1a, rule1b, rule1c, false) { $0 && $1 && $2 } ->> createButton

        // ============= rule2 =============
        reduce(passwordField, passwordConfirmField, "") {
            $0 == $1 ? "" : "The password does not match"
        } ->> errorLabel
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

