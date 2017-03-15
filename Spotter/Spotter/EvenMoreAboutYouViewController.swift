//
//  EvenMoreAboutYouViewController.swift
//  Spotter
//
//  Created by Matthew Trahan on 3/4/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit

class EvenMoreAboutYouViewController: UIViewController {
    
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var goalWeight: UITextField!
    var myHeightPicker = UIPickerView()
    var myWeightPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonStyle()
        setupHeightPicker(textField: height)
        setupWeightPicker(textField: weight, goal: false)
        setupWeightPicker(textField: goalWeight, goal: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonStyle() {
        height.backgroundColor = .clear
        height.layer.cornerRadius = 5
        height.layer.borderWidth = 1
        height.layer.borderColor = UIColor.black.cgColor
        
        weight.backgroundColor = .clear
        weight.layer.cornerRadius = 5
        weight.layer.borderWidth = 1
        weight.layer.borderColor = UIColor.black.cgColor
        
        goalWeight.backgroundColor = .clear
        goalWeight.layer.cornerRadius = 5
        goalWeight.layer.borderWidth = 1
        goalWeight.layer.borderColor = UIColor.black.cgColor
    }
    
    func setupHeightPicker(textField: UITextField) {
        // Sets up the "button"
        textField.text = "When is your height?"
        textField.textAlignment = .center
        
        // Removes the indicator of the UITextField
        textField.tintColor = UIColor.clear
        
        // Specifies intput type
        //myHeightPicker.datePickerMode = .date
        
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
        textField.inputView = myHeightPicker
        textField.inputAccessoryView = toolBar
    }
    
    func setupWeightPicker(textField: UITextField, goal: Bool) {
        // Sets up the "button"
        if goal {
            textField.text = "What is your weight?"
        } else {
            textField.text = "What is your goal weight?"
        }
        
        textField.textAlignment = .center
        
        // Removes the indicator of the UITextField
        textField.tintColor = UIColor.clear
        
        // Specifies intput type
        //myDatePicker.datePickerMode = .date
        
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
        textField.inputView = myWeightPicker
        textField.inputAccessoryView = toolBar
    }
    
    func doneClick(textField: UITextField, picker: UIPickerView) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        //textField.text = dateFormatter.string(from: picker)
        textField.resignFirstResponder()
        // AccountInformationViewController.birthdate = birthdate.text
    }
    
    func cancelClick(textField: UITextField) {
        textField.resignFirstResponder()
    }

}
