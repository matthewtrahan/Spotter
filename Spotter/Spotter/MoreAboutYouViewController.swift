//
//  MoreAboutYouViewController.swift
//  Spotter
//
//  Get the user's gender as well as their birthdate
//  through a segmented control and date picker, respectively.
//
//  Created by Matthew Trahan on 3/4/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit

class MoreAboutYouViewController: UIViewController {

    // storyboard elements
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var birthdate: UITextField!
    @IBOutlet weak var invalidLabel: UILabel!
    
    // date picker
    var myDatePicker: UIDatePicker = UIDatePicker()
    
    // core data info to be passed along
    var goal: String?
    var activity: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonStyle()
        setupDatePicker()
        
        // so that the back button says back
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        invalidLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // pass along data from previous VC's as well as current
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let seg = segue.destination as! EvenMoreAboutYouViewController
        
        seg.goal = goal
        seg.activity = activity
        
        // switch for the segmented controller
        switch self.genderSegmentedControl.selectedSegmentIndex {
            case 0: seg.gender = "Male"
            case 1: seg.gender = "Female"
            default: break
        }
        
        seg.birthdate = birthdate.text
    }
    
    // stylize the date field
    func buttonStyle() {
        birthdate.backgroundColor = .clear
        birthdate.layer.cornerRadius = 5
        birthdate.layer.borderWidth = 1
        birthdate.layer.borderColor = UIColor.black.cgColor
    }
    
    func setupDatePicker() {
        // Sets up the "button"
        birthdate.text = "When were you born?"
        birthdate.textAlignment = .center
        
        // Removes the indicator of the UITextField
        birthdate.tintColor = UIColor.clear
        
        // Specifies intput type
        myDatePicker.datePickerMode = .date
        
        // Creates the toolbar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        // Adds the buttons
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(MoreAboutYouViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(MoreAboutYouViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        // Adds the toolbar to the view
        birthdate.inputView = myDatePicker
        birthdate.inputAccessoryView = toolBar
    }
    
    // set up the done button for the toolbar
    func doneClick() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        birthdate.text = dateFormatter.string(from: myDatePicker.date)
        birthdate.resignFirstResponder()
    }
    
    // set up the cancel button for the toolbar
    func cancelClick() {
        birthdate.resignFirstResponder()
    }
    
    // do not allow the user to continue if all fields not filled in
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any!) -> Bool {
        if identifier == "cont" {
            if (birthdate.text! == "When were you born?") {
                invalidLabel.text = "Please fill in a birthdate."
                return false
            } else {
                invalidLabel.text = ""
                return true
            }
        }
        return true
    }
}

extension CGRect{
    init(_ x:CGFloat,_ y:CGFloat,_ width:CGFloat,_ height:CGFloat) {
        self.init(x: x ,y: y, width: width, height: height)
    }
    
}
