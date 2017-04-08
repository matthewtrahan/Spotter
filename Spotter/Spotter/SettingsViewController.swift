//
//  SettingsViewController.swift
//  Spotter
//
//  Created by Matthew Trahan on 4/6/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit
import CoreData

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let settings: [String] = ["Goal", "Weight"]
    var alertController: UIAlertController? = nil
    var updateField: UITextField? = nil
    
    // picker view for choosing a new goal
    var goalPicker: UIPickerView = UIPickerView()
    var goalPickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the delegates for the table view protocols.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.tableFooterView = UIView(frame: .zero)
        
        // setup picker views
        setupGoalPicker()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settings", for: indexPath)
        let index: Int = indexPath.row
        if settings[index] == "Goal" {
            cell.textLabel?.text = "Current Goal"
            let goal = getInfoFromCD(setting: settings[index])
            cell.detailTextLabel?.text = formatGoal(goal: goal)
        } else if settings[index] == "Weight" {
            cell.textLabel?.text = "Current Weight"
            cell.detailTextLabel?.text = getInfoFromCD(setting: settings[index]) + " lbs"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func getInfoFromCD(setting: String) -> String {
        let defaults = UserDefaults.standard
        let uname = defaults.value(forKey: "username")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let predicate = NSPredicate (format: "username = %@", uname as! CVarArg)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = predicate
        
        do {
            let fetchResult = try managedObjectContext.fetch(fetchRequest)
            if fetchResult.count > 0 {
                let user: User = fetchResult.first as! User
                if setting == "ultimateGoal" {
                    return user.ultimateGoal!
                } else {
                    return String(user.weight)
                }
                
            } else {
                return "error"
            }
            //return result
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return "error"
    }
    
    // update the core data if the user selects a new goal
    func updateCD() {
        
    }
    
    func formatGoal(goal: String) -> String {
        if goal == "buildMuscle" {
            return "Build Muscle"
        } else if goal == "maintainWeight" {
            return "Maintain Weight"
        } else {
            return "Lose Weight"
        }
    }
    
    func setupGoalPicker() {
        // Connect data
        self.tableView.delegate = self
        self.tableView.dataSource = self
        goalPickerData = ["Build Muscle", "Build Strength/Foundation", "Lose Weight"]
        
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
    }
    
    // set up the done button in the toolbar to set the text field to selected data
    func doneClick() {
        
    }
    
    // set up the cancel button to resign the picker view
    func cancelClick() {

    }
    
    // reload the table view to show the new data
    func pickerView(heightPicker: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.tableView.reloadData()
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return goalPickerData.count
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
