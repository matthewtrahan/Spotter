//
//  AccountInformationViewController.swift
//  Spotter
//
//  Created by Matthew Trahan on 3/4/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit
import CoreData

class AccountInformationViewController: UIViewController, UITextFieldDelegate {

    // storyboard elements
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var invalidLabel: UILabel!
    @IBOutlet weak var invalidLabel2: UILabel!
    @IBOutlet weak var backToLoginButton: UIButton!

    // core data info
    var goal: String?
    var activity: String?
    var gender: String?
    var birthdate: String?
    var height: String?
    var weight: Double?
    var goalWeight: Double?
    var userEmail: String?
    var userPassword: String?
    var userUsername: String?
    var coreData = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // so that the back button says back
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        buttonStyle()
        
        // implement dismissing the keyboard by tapping
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AccountInformationViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // need these so the return will dismiss the keyboard
        self.email.delegate = self
        self.password.delegate = self
        self.username.delegate = self
        
        invalidLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func completeSignUp(_ sender: Any) {
        // check if all fields are completed and give user feedback if not
        if (username.text!.isEmpty) || (password.text!.isEmpty) || (email.text!.isEmpty) {
            invalidLabel2.text = "Please fill in all fields."
            invalidLabel.text = ""
        }
        // check if the email is valid ie in <name>@<name>.<extension> format and give user feedback if needed
        else if (!isValidEmail(testStr: email.text!)) {
            invalidLabel2.text = ""
            invalidLabel.text = "Please enter a valid email."
        }
        // check the Core Data to see if the email is already in use and give user feedback if necessary
        else if (!checkUsernameOrEmailTaken(testStr: email.text!, entityToCheck: "email", format: "email == %@")) {
            invalidLabel2.text = ""
            invalidLabel.text = "Sorry, this email is taken."
        }
        // check the Core Data to see if the username is already in use and give user feedback if necessary
        else if (!checkUsernameOrEmailTaken(testStr: username.text!, entityToCheck: "username", format: "username == %@")) {
            invalidLabel2.text = "Sorry, this username is taken."
            invalidLabel.text = ""
        }
        // they are good to go, add the information to the CoreData base, tell them they are registered and give
        // a button to go back to the login page
        else {
            // add to core data
            userEmail = email.text
            userPassword = password.text
            userUsername = username.text
            saveUser(username: userUsername!, password: userPassword!, email: userEmail!, goal: goal!, activityLevel: activity!, gender: gender!, birthdate: birthdate!, height: height!, weight: weight!, goalWeight: goalWeight!)
            
            invalidLabel.text = ""
            invalidLabel2.text = "Registration successful!"
            invalidLabel2.textColor = UIColor.green
            
            backToLoginButton.setTitle("Back to Login", for: .normal)
            
        }
    }
    
    // save the data to memory
    func saveUser(username: String, password: String, email: String, goal: String, activityLevel: String, gender: String, birthdate: String, height: String, weight: Double, goalWeight: Double) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Create the entity we want to save
        let entity =  NSEntityDescription.entity(forEntityName: "User", in: managedContext)
        let user = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        user.setValue(username, forKey: "username")
        user.setValue(password, forKey: "password")
        user.setValue(email, forKey: "email")
        user.setValue(goal, forKey: "ultimateGoal")
        user.setValue(activityLevel, forKey: "activityLevel")
        user.setValue(gender, forKey: "gender")
        user.setValue(birthdate, forKey: "birthdate")
        user.setValue(height, forKey: "height")
        user.setValue(weight, forKey: "weight")
        user.setValue(goalWeight, forKey: "goalWeight")
        user.setValue(true, forKey: "colorSetting")
        
        // Commit the changes.
        do {
            try managedContext.save()
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            print("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        // append the changes
        coreData.append(user)
    }
    
    // style
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
    
    // use a regular expression to check for a valid email
    func isValidEmail(testStr: String) -> Bool {
        // must be in format <string>@<string>.<extension < 4 characters>
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    // query the core data to check if the username or email is in use
    func checkUsernameOrEmailTaken(testStr: String, entityToCheck: String, format: String) -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let predicate = NSPredicate(format: format, testStr)
        request.predicate = predicate
        request.fetchLimit = 1
        
        do {
            // if count is nonzero, they are in use
            let count = try managedContext.count(for: request)
            if(count == 0){
                return true
            } else {
                return false
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return true
    }
    
    // this method helps the one in viewDidLoad() to dismiss the keyboard with a tap
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
