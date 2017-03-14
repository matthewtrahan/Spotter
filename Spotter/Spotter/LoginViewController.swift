//
//  LoginViewController.swift
//  Spotter
//
//  Created by Matthew Trahan on 3/4/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit

class LoginViewController: UIPageViewController, UITextFieldDelegate {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var invalidLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // implement dismissing the keyboard by tapping
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // need these so the return will dismiss the keyboard
//        self.username.delegate = self
//        self.password.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButton(_ sender: Any) {
        if (username.text?.isEmpty)! || (password.text?.isEmpty)! {
            invalidLabel.text = "Please fill in username and password field."
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

}
