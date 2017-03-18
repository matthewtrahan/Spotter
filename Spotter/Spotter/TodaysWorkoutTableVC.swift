//
//  TodaysWorkoutTableVC.swift
//  Spotter
//
//  Created by Matthew Trahan on 3/18/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit

class TodaysWorkoutTableVC: UITableViewController {

    let dayOfWeek = Date().dayNumberOfWeek()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        // #warning Incomplete implementation, return the number of rows
        return WorkoutPlans.sharedInstance.loseWeightBackBiceps.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return WorkoutPlans.sharedInstance.loseWeightTitles[dayOfWeek!]
    }
    
    // style section header
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textAlignment = .center
    }
    
    // adjust height of section header
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80.0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index: Int = indexPath.row
        
        // we want the first cell to be like a header so use the first prototype cell from sb
        if index == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuse", for: indexPath)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! WorkoutTableViewCell
        
        // Configure the cell...
        
        cell.exercise.text = WorkoutPlans.sharedInstance.loseWeightBackBiceps[index].0
        cell.reps.text = String(WorkoutPlans.sharedInstance.loseWeightBackBiceps[index].1)
        cell.sets.text = String(WorkoutPlans.sharedInstance.loseWeightBackBiceps[index].2)
        
        return cell
    }
 
}

// extend the date class to get a number, 0-6 for the day of the week it is
extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday! - 1
    }
}
