//
//  SettingsTableViewController.swift
//  Spotter
//
//  Created by Matthew Trahan on 4/11/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit
import CoreData

class SettingsTableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var ultimateGoalDetail: UILabel!
    @IBOutlet weak var weightDetail: UILabel!
    @IBOutlet weak var colorSwitch: UISwitch!
    @IBOutlet weak var goalPicker: UIPickerView!
    
    var goals: [String] = ["Build Muscle", "Build Foundation/Strength", "Lose Weight"]
    var pickerHidden = true
    var user: User?
    var alertController: UIAlertController? = nil
    var colorSetting: Bool = true
    var newWeight: UITextField? = nil
    
    var logoutClicked: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalPicker.dataSource = self
        goalPicker.delegate = self
        
        ultimateGoalDetail.text = formatGoal(goal: getInfoFromCD(setting: "ultimateGoal"))
        weightDetail.text = getInfoFromCD(setting: "weight")
        
        let colorResult = getInfoFromCD(setting: "colorSetting")
        colorSetting = colorResult == "true" ? true : false
        setupColors(setting: colorSetting)
        
        colorSwitch.addTarget(self, action: #selector(switchValueDidChange), for: .valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func switchValueDidChange() {
        if colorSwitch.isOn {
            Appearance.updateCellColor(color: UIColor.black)
            Appearance.updateNavBarColor(color: UIColor.black)
            self.navigationController?.navigationBar.backgroundColor = UIColor.black
            self.navigationController?.navigationBar.tintColor = UIColor.black
            self.navigationController?.navigationBar.barTintColor = UIColor.black
        } else {
            Appearance.updateCellColor(color: Config.toggleColor)
            Appearance.updateNavBarColor(color: Config.toggleColor)
            self.navigationController?.navigationBar.backgroundColor = Config.toggleColor
            self.navigationController?.navigationBar.tintColor = Config.toggleColor
            self.navigationController?.navigationBar.barTintColor = Config.toggleColor
        }
        updateCD(key: "colorSetting", setting: String(!self.colorSetting))
    }
    
    func setupColors(setting: Bool) {
        Config.customTableHeaderCellColor = setting ? UIColor.black : Config.toggleColor
        Config.customNavBarColor = setting ? UIColor.black : Config.toggleColor
        if setting {
            colorSwitch.setOn(true, animated: false)
        } else {
            colorSwitch.setOn(false, animated: false)
        }
    }
    
    // different setting functionalities
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            togglePicker()
        }
        // provide an alert controller to get a new weight
        else if indexPath.section == 0 && indexPath.row == 2 {
            self.alertController = UIAlertController(title: "Update Weight", message: "Please enter a new weight. Current weight: \(weightDetail.text!)", preferredStyle: UIAlertControllerStyle.alert)
            
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                // add a .0 to the end for consistency or only take in the first digit after decimal
                if (self.newWeight?.text)!.contains(".") {
                    let index = (self.newWeight?.text)!.characters.index(of: ".")
                    let end = (self.newWeight?.text)!.substring(from: index!)
                    let realEnd = end.substring(to: end.length - (end.length - 2))
                    self.weightDetail.text! = (self.newWeight?.text)!.substring(to: index!) + realEnd
                } else {
                    self.weightDetail.text! = (self.newWeight?.text)! + ".0"
                }
                self.updateCD(key: "weight", setting: self.weightDetail.text!)
                print("Ok Button Pressed")
            })
            let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) -> Void in
                print("Cancel Button Pressed")
            }
            
            self.alertController!.addAction(ok)
            self.alertController!.addAction(cancel)
            
            self.alertController!.addTextField { (textField) -> Void in
                // Enter the textfield customization code here.
                self.newWeight = textField
                self.newWeight?.placeholder = "New Weight"
            }
            
            newWeight!.keyboardType = UIKeyboardType.decimalPad
            
            present(self.alertController!, animated: true, completion: nil)
        }
        // add a check for logging out with a action sheet
        else if indexPath.section == 2 && indexPath.row == 0 {
            self.alertController = UIAlertController(title: nil, message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
            
            let logoutButton = UIAlertAction(title: "Logout", style: .destructive, handler: { (action) -> Void in
                self.logoutClicked = true
                Appearance.updateNavBarColor(color: UIColor.black)
                self.navigationController?.navigationBar.backgroundColor = UIColor.black
                self.navigationController?.navigationBar.tintColor = UIColor.black
                self.navigationController?.navigationBar.barTintColor = UIColor.black
                self.performSegue(withIdentifier: "logout", sender: self)
                print("Logout button tapped")
            })
            
            let cancelButton = UIAlertAction(title: "Cancel", style: .default, handler: { (action) -> Void in
                print("Cancel button tapped")
            })
            
            self.alertController?.addAction(logoutButton)
            self.alertController?.addAction(cancelButton)
            
            self.present(alertController!, animated: true, completion: nil)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any!) -> Bool {
        if identifier == "logout" {
            return logoutClicked ? true : false
        }
        return false
    }
    
    // change the height when clicked
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if pickerHidden && indexPath.section == 0 && indexPath.row == 1 {
            return 0
        }
        else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    // show the picker when clicked
    func togglePicker() {
        pickerHidden = !pickerHidden
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    // pull the data from CD to show the user the current value
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
                user = fetchResult.first as! User?
                if setting == "ultimateGoal" {
                    return user!.ultimateGoal!
                } else if setting == "colorSetting" {
                    return String(user!.colorSetting)
                } else {
                    return String(user!.weight)
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
    func updateCD(key: String, setting: String) {
        if key == "ultimateGoal" {
            let update: String = deformatGoal(goal: setting)
            user?.setValue(update, forKey: key)
        } else if key == "colorSetting" {
            let update: Bool = colorSwitch.isOn ? true : false
            user?.setValue(update, forKey: key)
        } else if key == "weight" {
            let update: Double = Double(setting)!
            user?.setValue(update, forKey: key)
        }
        
        do {
            try user?.managedObjectContext?.save()
        } catch {
            let saveError = error as NSError
            print(saveError)
        }
    }
    
    // for core data consistency and ui
    func formatGoal(goal: String) -> String {
        if goal == "buildMuscle" {
            return "Build Muscle"
        } else if goal == "maintainWeight" {
            return "Build Foundation/Strength"
        } else {
            return "Lose Weight"
        }
    }
    
    // for core data consistency and ui
    func deformatGoal(goal: String) -> String {
        if goal == "Build Muscle" {
            return "buildMuscle"
        } else if goal == "Build Foundation/Strength" {
            return "maintainWeight"
        } else {
            return "loseWeight"
        }
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return goals.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return goals[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ultimateGoalDetail.text = goals[row]
        updateCD(key: "ultimateGoal", setting: ultimateGoalDetail.text!)
    }
    
    // reload the table view to show the new data
    func pickerView(heightPicker: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.tableView.reloadData()
    }

}

// so indexing a string is normal
extension String {
    
    var length: Int {
        return self.characters.count
    }
    
    subscript (i: Int) -> String {
        return self[Range(i ..< i + 1)]
    }
    
    func substring(from: Int) -> String {
        return self[Range(min(from, length) ..< length)]
    }
    
    func substring(to: Int) -> String {
        return self[Range(0 ..< max(0, to))]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return self[Range(start ..< end)]
    }
    
}
