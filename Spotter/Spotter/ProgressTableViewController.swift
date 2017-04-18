//
//  ProgressTableViewController.swift
//  Spotter
//
//  Created by Matthew Trahan on 4/14/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit
import Charts

class ProgressTableViewController: UITableViewController {

    let exercises: [String: [Exercise]] = WorkoutPlans.getDictOfExercises()
    var titles: [String]?
    var sortedTitles: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titles = Array(exercises.keys)
        sortedTitles = titles?.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sortedTitles!.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionName = sortedTitles?[section]
        return exercises[sectionName!]!.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sortedTitles?[section]
    }
    
    // style section header
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textAlignment = .center
    }

    // list the exercises
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "progress", for: indexPath)

        // Configure the cell...
        let sectionNumber = indexPath.section
        let key = sortedTitles?[sectionNumber]
        let currentExercise = exercises[key!]?[indexPath.row]
        cell.textLabel?.text = currentExercise?.name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
}
