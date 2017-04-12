//
//  TodaysWorkoutTableVC.swift
//  Spotter
//
//  Created by Matthew Trahan on 3/18/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit
import CoreData

class TodaysWorkoutTableVC: UITableViewController {

    var dayOfWeek = Date().dayNumberOfWeek()
    let workoutData = WorkoutPlans()
    var user: String?
    var userWorkout: [(String, String, String, Exercise)]?
    var userTitles: [String]?
    var colorSettings: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
                
        let defaults = UserDefaults.standard

        // Get the username from UserDefaults
        self.user = defaults.value(forKey: "username") as? String
        
        userWorkout = self.getUsersPlan(user: user!)
    }
    
    // this refreshes the workouts when a new setting is selected
    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        self.user = defaults.value(forKey: "username") as? String
        userWorkout = self.getUsersPlan(user: user!)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userWorkout!.count + 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return userTitles?[dayOfWeek!]
    }
    
    // style section header
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textAlignment = .center
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var index: Int = indexPath.row
        
        // we want the first cell to be like a header so use the first prototype cell from sb
        if index == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuse", for: indexPath)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! WorkoutTableViewCell
        
        // Configure the cell...
        index -= 1
        cell.exercise.text = userWorkout?[index].0
        cell.reps.text = String(describing: userWorkout![index].1)
        cell.sets.text = String(describing: userWorkout![index].2)
        
        return cell
    }
    
    func getUsersPlan(user: String) -> [(String, String, String, Exercise)] {
        // get the goal from core data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let predicate = NSPredicate (format:"username = %@", user)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = predicate
        do {
            let fetchResult = try managedObjectContext.fetch(fetchRequest)
            if fetchResult.count > 0 {
                // fetch the user's goal
                let objectEntity: User = fetchResult.first as! User
                let userGoal = objectEntity.ultimateGoal
                colorSettings = objectEntity.colorSetting
                loadColors(setting: colorSettings)
                if userGoal == "loseWeight" {
                    userTitles = workoutData.getWorkoutTitles(goal: userGoal!)
                    var allWorkouts = workoutData.getWorkoutPlans(goal: userGoal!)
                    return allWorkouts[dayOfWeek!]
                } else if userGoal == "maintainWeight" {
                    userTitles = workoutData.getWorkoutTitles(goal: userGoal!)
                    var allWorkouts = workoutData.getWorkoutPlans(goal: userGoal!)
                    return allWorkouts[dayOfWeek!]
                } else {
                    userTitles = workoutData.getWorkoutTitles(goal: userGoal!)
                    var allWorkouts = workoutData.getWorkoutPlans(goal: userGoal!)
                    return allWorkouts[dayOfWeek!]
                }
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return [("error", "", "", Exercise(name: "error", description: "error", videoLink: "error"))]
    }
    
    func loadColors(setting: Bool) {
        if setting {
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
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        let seg = segue.destination as! ExerciseDetailsViewController
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let chosenExercise = userWorkout?[indexPath.row - 1].3
            seg.selectedExercise = chosenExercise!
            seg.selectedVideo = chosenExercise?.videoLink
        }
    }
 
}

// extend the date class to get a number, 0-6 for the day of the week it is
extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday! - 1
    }
}
