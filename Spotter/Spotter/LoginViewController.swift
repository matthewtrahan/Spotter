//
//  LoginViewController.swift
//  Spotter
//
//  Created by Matthew Trahan on 3/4/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var invalidLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // implement dismissing the keyboard by tapping
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // need these so the return will dismiss the keyboard
        self.username.delegate = self
        self.password.delegate = self
        
        textFieldStyle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButton(_ sender: Any) {
        if (username.text?.isEmpty)! || (password.text?.isEmpty)! {
            invalidLabel.text = "Please fill in both fields."
        } else {
            // check for valid username and password
            let loginCheck = checkValidUsernameAndPassword()
            if !loginCheck {
                invalidLabel.text = "Username or password do not match."
            } else {
                // log in
            }
        }
    }
    
    func checkValidUsernameAndPassword() -> Bool {
        return true
    }
    
    // this function dismisses the keyboard when returning
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true;
    }
    
    // this method helps the one in viewDidLoad() to dismiss the keyboard with a tap
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldStyle() {
        username.backgroundColor = .clear
        username.layer.cornerRadius = 5
        username.layer.borderWidth = 1
        username.layer.borderColor = UIColor.black.cgColor
        
        password.backgroundColor = .clear
        password.layer.cornerRadius = 5
        password.layer.borderWidth = 1
        password.layer.borderColor = UIColor.black.cgColor
    }

}
