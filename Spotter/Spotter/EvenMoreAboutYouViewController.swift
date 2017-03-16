//
//  EvenMoreAboutYouViewController.swift
//  Spotter
//
//  Created by Matthew Trahan on 3/4/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit

class EvenMoreAboutYouViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var goalWeight: UITextField!
    @IBOutlet weak var invalidLabel: UILabel!
    var heightPicker: UIPickerView = UIPickerView()
    var heightPickerData: [[String]] = [[String]]()
    var goal: String?
    var activity: String?
    var gender: String?
    var birthdate: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonStyle()
        weight.keyboardType = UIKeyboardType.decimalPad
        goalWeight.keyboardType = UIKeyboardType.decimalPad
        
        // implement dismissing the keyboard by tapping
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EvenMoreAboutYouViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // need these so the return will dismiss the keyboard
        self.height.delegate = self
        self.weight.delegate = self
        self.goalWeight.delegate = self
        
        // so that the back button says back
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        createPlaceholders()
        setupHeightPicker()
        
        invalidLabel.text = ""
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return heightPickerData[component].count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return heightPickerData[component][row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupHeightPicker() {
        // Connect data
        self.heightPicker.delegate = self
        self.heightPicker.dataSource = self
        heightPickerData = [["3'", "4'", "5'", "6'", "7'"],
                            ["0\"", "1\"", "2\"", "3\"", "4\"", "5\"", "6\"", "7\"", "8\"", "9\"", "10\"", "11\""]]
        
        // Creates the toolbar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        // Adds the buttons
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(EvenMoreAboutYouViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(EvenMoreAboutYouViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        // Adds the heightPicker to the text field view
        height.inputView = heightPicker
        height.inputAccessoryView = toolBar
    }
    
    func pickerView(heightPicker: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        height.text = heightPickerData[row][component]
    }
    
    func doneClick() {
        let feetRow = heightPicker.selectedRow(inComponent: 0)
        let inchesRow = heightPicker.selectedRow(inComponent: 1)
        height.text = "\(heightPickerData[0][feetRow]) \(heightPickerData[1][inchesRow])"
        height.resignFirstResponder()
        // AccountInformationViewController.height = height.text
    }
    
    func cancelClick() {
        height.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let seg = segue.destination as! AccountInformationViewController
        
        seg.goal = goal
        seg.activity = activity
        seg.gender = gender
        seg.birthdate = birthdate
        
        seg.height = height.text
        seg.weight = Double(weight.text!)
        seg.goalWeight = Double(goalWeight.text!)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any!) -> Bool {
        if identifier == "cont" {
            if (height.text!.isEmpty) || (weight.text!.isEmpty) || (goalWeight.text!.isEmpty) {
                invalidLabel.text = "Please fill in all fields."
                return false
            } else {
                invalidLabel.text = ""
                return true
            }
        }
        return true
    }
    
    func createPlaceholders() {
        // Sets up the "buttons"
        height.placeholder = "What is your height?"
        height.textAlignment = .center
        weight.placeholder = "What is your current weight?"
        weight.textAlignment = .center
        goalWeight.placeholder = "What is your goal weight?"
        goalWeight.textAlignment = .center
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
    
    // this method helps the one in viewDidLoad() to dismiss the keyboard with a tap
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
