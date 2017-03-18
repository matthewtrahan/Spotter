//
//  WorkoutPlans.swift
//  Spotter
//
//  Created by Matthew Trahan on 3/18/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import Foundation

class WorkoutPlans {
    let loseWeightTitles: [String] = ["Back & Biceps", "Legs & Abs", "Rest", "Chest & Triceps", "Cardio", "Rest", "Cardio"]
    let loseWeightBackBiceps: [(String, Int, Int)] = [("Bicep Curls", 12, 3), ("Pullups", 10, 3)]
    
    static let sharedInstance = WorkoutPlans()
}
