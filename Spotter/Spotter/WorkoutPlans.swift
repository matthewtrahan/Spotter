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
    let loseWeightWorkouts: [[(String, Int, Int)]] = [[("Bicep Curls", 12, 3), ("Pullups", 10, 3)], [("Back Squats", 12, 5)], [("Rest", 0, 0)], [("Bench Press", 8, 3)], [("10 Minute Run", 3, 1)], [("Rest", 0, 0)], [("10 Minute Run", 3, 1)]]
    
    let maintainWeightTitles: [String] = ["Back & Biceps", "Legs & Abs", "Rest", "Chest & Triceps", "Cardio", "Rest", "Rest"]
    let maintainWeightWorkouts: [[(String, Int, Int)]] = [[("Bicep Curls", 12, 3), ("Pullups", 10, 3)], [("Back Squats", 12, 5)], [("Rest", 0, 0)], [("Bench Press", 8, 3)], [("10 Minute Run", 3, 1)], [("Rest", 0, 0)], [("Rest", 0, 0)]]
    
    let buildMuscleTitles: [String] = ["Back & Biceps", "Legs & Abs", "Chest & Triceps", "Back & Biceps", "Legs & Abs", "Chest & Triceps", "Rest"]
    let buildMuscleWorkouts: [[(String, Int, Int)]] = [[("Bicep Curls", 8, 5), ("Preacher Curls", 10, 3)], [("Back Squats", 12, 5)], [("Bench Press", 8, 3)], [("Bicep Curls", 8, 5), ("Preacher Curls", 10, 3)], [("Back Squats", 12, 5)], [("Bench Press", 8, 3)], [("Rest", 0, 0)]]
}
