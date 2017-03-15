//
//  AccountInformationViewController.swift
//  Spotter
//
//  Created by Matthew Trahan on 3/4/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit

class AccountInformationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var invalidLabel: UILabel!
    @IBOutlet weak var invalidLabel2: UILabel!
    var goal: String = ""
    var activity: String = ""
    var gender: String = ""
    var birthdate: Date?
    var height: String = ""
    var weight: Double = 0.0
    var goalWeight: Double = 0.0
    var userEmail: String = ""
    var userPassword: String = ""
    var userUsername: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // so that the back button says back
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        buttonStyle()
        
        // implement dismissing the keyboard by tapping
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // need these so the return will dismiss the keyboard
        self.email.delegate = self
        self.password.delegate = self
        self.username.delegate = self
        
        invalidLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any!) -> Bool {
        if identifier == "cont" {
            if (username.text!.isEmpty) || (password.text!.isEmpty) || (password.text!.isEmpty) {
                invalidLabel2.text = "Please fill in all fields."
                invalidLabel.text = ""
                return false
            } else if (!isValidEmail(testStr: email.text!)) {
                invalidLabel2.text = ""
                invalidLabel.text = "Please enter a valid email."
                return false
            } else {
                // add to core data
                return true
            }
        }
        return true
    }
    
    @IBAction func completeSignUp(_ sender: Any) {
        if (username.text!.isEmpty) || (password.text!.isEmpty) || (password.text!.isEmpty) {
            invalidLabel.text = "Please fill in all fields."
            invalidLabel2.text = ""
        } else if (!isValidEmail(testStr: email.text!)) {
            invalidLabel.text = ""
            invalidLabel2.text = "Please enter a valid email."
        } else {
            // add to core data
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func buttonStyle() {
        email.backgroundColor = .clear
        email.layer.cornerRadius = 5
        email.layer.borderWidth = 1
        email.layer.borderColor = UIColor.black.cgColor
        
        username.backgroundColor = .clear
        username.layer.cornerRadius = 5
        username.layer.borderWidth = 1
        username.layer.borderColor = UIColor.black.cgColor
        
        password.backgroundColor = .clear
        password.layer.cornerRadius = 5
        password.layer.borderWidth = 1
        password.layer.borderColor = UIColor.black.cgColor
    }
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    

}
