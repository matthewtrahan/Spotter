//
//  UltimateGoalViewController.swift
//  Spotter
//
//  Created by Matthew Trahan on 3/4/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit

class UltimateGoalViewController: UIViewController {

    @IBOutlet weak var loseWeight: UIButton!
    @IBOutlet weak var maintainWeight: UIButton!
    @IBOutlet weak var buildMuscle: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonStyle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
        //AccountInformationViewController.goal = "loseWeight"
    }
    
    @IBAction func maintainWeightSelected(_ sender: Any) {
        loseWeight.backgroundColor = .clear
        maintainWeight.backgroundColor = UIColor.lightGray
        buildMuscle.backgroundColor = .clear
        //AccountInformationViewController.goal = "maintainWeight"
    }
    
    @IBAction func buildMuscleSelected(_ sender: Any) {
        loseWeight.backgroundColor = .clear
        maintainWeight.backgroundColor = .clear
        buildMuscle.backgroundColor = UIColor.lightGray
        //AccountInformationViewController.goal = "buildMuscle"
    }
}
