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
                
        // Do any additional setup after loading the view, typically from a nib.
        let rule1a = reduce(usernameField, emailField, false) { username, email in
            countElements(username) > 0 && countElements(email) > 0
        }
        
        let rule1b = reduce(passwordField, passwordConfirmField, false) { password, confirmPassword in
            password == confirmPassword
        }
        
        let rule1c = passwordField.map {countElements($0) >= 8}
                
        reduce(rule1a, rule1b, rule1c, false) { rule1aOk, rule1bOk, rule1cOk in
            rule1aOk && rule1bOk && rule1cOk
        } ->> createButton
        
        reduce(passwordField, passwordConfirmField, "") { password, confirmPassword -> String in
            password == confirmPassword ? "" : "The password does not match"
        } ->> errorLabel
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

