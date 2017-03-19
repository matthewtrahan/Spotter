//
//  LoginViewController.swift
//  Spotter
//
//  This is the VC that is presented to the user on launch. 
//  It checks for a valid username and password combination,
//  provides an option to sign up, login, or change their
//  password and proceeds with a login when given valid creds.
//
//  Created by Matthew Trahanvar 3/4/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController, UITextFieldDelegate {

    // storyboard elements
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
        
        // style the text fields and set the feedback label to empty
        textFieldStyle()
        invalidLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // check to see if we should take the segue - validate username/password
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any!) -> Bool {
        if identifier == "login" {
            // they must fill in both fields to have a chance at logging in. do not want to segue in this case
            if (username.text?.isEmpty)! || (password.text?.isEmpty)! {
                invalidLabel.text = "Please fill in both fields."
                return false
            } else {
                // check for valid username and password
                let loginCheck = checkValidUsernameAndPassword(uname: self.username.text!, password: self.password.text!)
                if !loginCheck {
                    // the user input an invalid username/password combination
                    invalidLabel.text = "Username or password is incorrect."
                    
                    // do not want to segue to account in this case - invalid credentials
                    return false
                } else {
                    // log in - valid credentials
                    return true
                }
            }
        }
        return true
    }
    
    // save the username to NSUserDefaults so we know which user is logged in
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create UserDefaults
        let defaults = UserDefaults.standard
        
        // Save String value to UserDefaults so we can retrieve it later
        defaults.set(username.text!, forKey: "username")
    }
    
    // check if the username exists and that the username/password match
    func checkValidUsernameAndPassword(uname: String, password: String) -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let predicate = NSPredicate (format: "username = %@", uname)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = predicate
        
        do {
            let fetchResult = try managedObjectContext.fetch(fetchRequest)
            if fetchResult.count > 0 {
                let objectEntity: User = fetchResult.first as! User
                if objectEntity.username == uname && objectEntity.password == password {
                    // they match with the Core Data
                    return true
                } else {
                    // wrong username/password combination
                    return false
                }
            } else {
                // invalid username
                return false
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return false
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
    
    // make the text fields pretty
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
