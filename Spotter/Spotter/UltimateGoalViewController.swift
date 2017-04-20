//
//  UltimateGoalViewController.swift
//  Spotter
//
//  This VC gets the user's ultimate goal with 
//  clickable buttons that highlight on touch.
//
//  Created by Matthew Trahan on 3/4/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit

class UltimateGoalViewController: UIViewController {

    // storyboard elements
    @IBOutlet weak var loseWeight: UIButton!
    @IBOutlet weak var maintainWeight: UIButton!
    @IBOutlet weak var buildMuscle: UIButton!
    @IBOutlet weak var invalidLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonStyle()
        
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
    
    // stylize the buttons (round them, outline, etc)
    func buttonStyle() {
        loseWeight.backgroundColor = .clear
        loseWeight.layer.cornerRadius = 5
        loseWeight.layer.borderWidth = 1
        loseWeight.layer.borderColor = UIColor.black.cgColor
        
        maintainWeight.backgroundColor = .clear
        maintainWeight.layer.cornerRadius = 5
        maintainWeight.layer.borderWidth = 1
        maintainWeight.layer.borderColor = UIColor.black.cgColor
        
        buildMuscle.backgroundColor = .clear
        buildMuscle.layer.cornerRadius = 5
        buildMuscle.layer.borderWidth = 1
        buildMuscle.layer.borderColor = UIColor.black.cgColor
    }
    
    // functions that change the background color when an option is selected
    @IBAction func loseWeightSelected(_ sender: Any) {
        loseWeight.backgroundColor = UIColor.lightGray
        maintainWeight.backgroundColor = .clear
        buildMuscle.backgroundColor = .clear
    }
    
    @IBAction func maintainWeightSelected(_ sender: Any) {
        loseWeight.backgroundColor = .clear
        maintainWeight.backgroundColor = UIColor.lightGray
        buildMuscle.backgroundColor = .clear
    }
    
    @IBAction func buildMuscleSelected(_ sender: Any) {
        loseWeight.backgroundColor = .clear
        maintainWeight.backgroundColor = .clear
        buildMuscle.backgroundColor = UIColor.lightGray
    }
    
    // pass the goal to the next VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let seg = segue.destination as! ActivityLevelViewController
        if loseWeight.backgroundColor == UIColor.lightGray {
            seg.goal = "loseWeight"
        } else if maintainWeight.backgroundColor == UIColor.lightGray {
            seg.goal = "maintainWeight"
        } else {
            seg.goal = "buildMuscle"
        }
        
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    // if a user has not chosen an option, do not let them continue
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any!) -> Bool {
        if identifier == "cont" {
            if (loseWeight.backgroundColor == .clear) && (maintainWeight.backgroundColor == .clear) && (buildMuscle.backgroundColor == .clear) {
                invalidLabel.text = "Please choose a goal."
                return false
            } else {
                invalidLabel.text = ""
                return true
            }
        }
        return true
    }
}
