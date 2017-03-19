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
    
    let maintainWeightTitles: [String] = ["Back & Biceps", "Legs & Abs", "Rest", "Chest & Triceps", "Cardio", "Rest", "Rest"]
    let maintainWeightBackBiceps: [(String, Int, Int)] = [("Bicep Curls", 12, 3), ("Pullups", 10, 3)]
    
    let buildMuscleTitles: [String] = ["Back & Biceps", "Legs & Abs", "Chest & Triceps", "Back & Biceps", "Legs & Abs", "Chest & Triceps", "Rest"]
    let buildMuscleBackBiceps: [(String, Int, Int)] = [("Bicep Curls", 8, 5), ("Preacher Curls", 10, 3)]
}
