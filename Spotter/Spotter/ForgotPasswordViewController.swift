//
//  ForgotPasswordViewController.swift
//  Spotter
//
//  Created by Matthew Trahan on 3/4/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit
import CoreData

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var backToLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func resetPassword(_ sender: Any) {
        if (email.text!.isEmpty) || (username.text!.isEmpty) || (newPassword.text!.isEmpty) {
            feedbackLabel.text = "Please fill in all fields."
            feedbackLabel.textColor = UIColor.red
        } else if !emailUsernameMatch(email: email.text!, username: username.text!) {
            feedbackLabel.text = "Invalid email/username combination."
            feedbackLabel.textColor = UIColor.red
        } else {
            updatePassword(username: username.text!, newPassword: newPassword.text!)
            feedbackLabel.text = "Password reset."
            feedbackLabel.textColor = UIColor.green
            
            backToLoginButton.setTitle("Back to Login", for: .normal)
        }
    }
    
    func emailUsernameMatch(email: String, username: String) -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let predicate = NSPredicate (format:"username = %@", username)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = predicate
        do {
            let fetchResult = try managedObjectContext.fetch(fetchRequest)
            if fetchResult.count > 0 {
                let objectEntity: User = fetchResult.first as! User
                if objectEntity.username == username && objectEntity.email == email {
                    // they match with the Core Data
                    return true
                }
                else {
                    // wrong username/email combination
                    return false
                }
            }
            else {
                return false
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return true
    }
    
    func updatePassword(username: String, newPassword: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let predicate = NSPredicate (format:"username = %@", username)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = predicate
        do {
            let fetchResult = try managedObjectContext.fetch(fetchRequest)
            if fetchResult.count > 0 {
                let objectEntity: User = fetchResult.first as! User
                objectEntity.setValue(newPassword, forKey: "password")
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
