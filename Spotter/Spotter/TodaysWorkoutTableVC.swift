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

    let dayOfWeek = Date().dayNumberOfWeek()
    let workoutData = WorkoutPlans()
    var user: String?
    var userWorkout: [(String, Int, Int)]?
    var userTitles: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        // Get the username from UserDefaults
        self.user = defaults.value(forKey: "username") as? String
        
        userWorkout = self.getUsersPlan(user: user!)
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
    
    func getUsersPlan(user: String) -> [(String, Int, Int)] {
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
                if userGoal == "loseWeight" {
                    userTitles = workoutData.loseWeightTitles
                    return workoutData.loseWeightWorkouts[dayOfWeek!]
                } else if userGoal == "maintainWeight" {
                    userTitles = workoutData.maintainWeightTitles
                    return workoutData.maintainWeightWorkouts[dayOfWeek!]
                } else {
                    userTitles = workoutData.buildMuscleTitles
                    return workoutData.buildMuscleWorkouts[dayOfWeek!]
                }
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return [("error", 0, 0)]
    }
 
}

// extend the date class to get a number, 0-6 for the day of the week it is
extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday! - 1
    }
}

//func loadYoutube(videoID videoID:String) {
//    // create a custom youtubeURL with the video ID
//    guard
//        let youtubeURL = NSURL(string: "https://www.youtube.com/embed/\(videoID)")
//        else { return }
//    // load your web request
//    wv.loadRequest( NSURLRequest(URL: youtubeURL) )
//}
