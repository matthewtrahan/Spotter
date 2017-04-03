//
//  WorkoutPlans.swift
//  Spotter
//
//  Created by Matthew Trahan on 3/18/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import Foundation

class WorkoutPlans {
    let deadlift: Exercise = Exercise(name: "Deadlift", description: "description here", videoLink: "a5zhnubunoE")
    let squat: Exercise = Exercise(name: "Squat", description: "description here", videoLink: "tVB1q8zkP3o")
    let benchPress: Exercise = Exercise(name: "Bench Press", description: "description here", videoLink: "RsobeWfbBcY")
    let overheadPress: Exercise = Exercise(name: "Overhead Press", description: "description here", videoLink: "0JfYxMRsUCQ")
    let sprints: Exercise = Exercise(name: "Sprints", description: "description here", videoLink: "5cnVAgk3G7o")
    
    let restToDo: Exercise = Exercise(name: "todo name", description: "todo desc", videoLink: "UMQTQhdizxI")
    
    func getWorkoutTitles(goal: String) -> [String] {
        let loseWeightTitles: [String] = ["Back & Biceps", "Legs", "Rest", "Chest & Triceps", "Shoulders", "Rest", "Cardio & Abs"]
        let maintainWeightTitles: [String] = ["Back & Biceps", "Legs", "Rest", "Chest & Triceps", "Shoulders", "Rest", "Cardio & Abs"]
        let buildMuscleTitles: [String] = ["Back & Biceps", "Legs", "Rest", "Chest & Triceps", "Shoulders", "Rest", "Cardio & Abs"]
        
        if goal == "loseWeight" {
            return loseWeightTitles
        } else if goal == "maintainWeight" {
            return maintainWeightTitles
        } else {
            return buildMuscleTitles
        }
    }
    
    func getWorkoutPlans(goal: String) -> [[(String, String, String, Exercise)]] {
        let loseWeightWorkouts: [[(String, String, String, Exercise)]] = [
            [(deadlift.name, "12", "3", deadlift), ("Lat Pulldown", "10-12", "3", restToDo), ("T-Bar Rows", "10-12" ,"3", restToDo), ("Bicep Curls", "15", "3", restToDo), ("Bicep Burnouts", "TF" , "3", restToDo)],
            [(squat.name, "12", "3", squat), ("Leg Press", "15", "3", restToDo), ("Leg Extensions", "12", "3", restToDo), ("Leg Curls", "12", "3", restToDo), ("Calf Raises", "20", "3", restToDo)],
            [("Rest", "", "", restToDo)],
            [(benchPress.name, "12", "3", benchPress), ("Chest Flys", "12", "3", restToDo), ("Tricep Extensions", "15", "3", restToDo), ("Tricep Kickbacks", "12", "3", restToDo), ("Dips", "TF", "3", restToDo)],
            [(overheadPress.name, "12", "3", overheadPress), ("Lateral Raises", "15", "3", restToDo), ("Rear Delt Raises", "15", "3", restToDo), ("Suicide Raises", "15", "3", restToDo), ("Cable Lat Raises", "TF", "3", restToDo)], [("Rest", "", "", restToDo)],
            [(sprints.name, "TF", "3", sprints), ("Crunches", "20-25", "3", restToDo), ("Leg Raises", "20-25", "3", restToDo), ("Toe Touches", "20-25", "3", restToDo), ("Sit-Ups", "20-25", "3", restToDo)]]

        let maintainWeightWorkouts: [[(String, String, String, Exercise)]] = [
            [(deadlift.name, "8", "3", deadlift), ("Lat Pulldown", "6-8", "3",restToDo), ("T-Bar Rows", "6-8" ,"3",restToDo), ("Bicep Curls", "8-10", "3", restToDo), ("Bicep Burnouts", "TF" , "3", restToDo)],
            [(squat.name, "6-8", "3", squat), ("Leg Press", "6-8", "3", restToDo), ("Leg Extensions", "12", "3", restToDo), ("Leg Curl", "12", "3", restToDo), ("Calf Raises", "20", "3", restToDo)],
            [("Rest", "", "", restToDo)],
            [(benchPress.name, "6-8", "3", benchPress), ("Chest Flys", "12", "3", restToDo), ("Tricep Extensions", "10", "3", restToDo), ("Tricep Kickbacks", "12", "3", restToDo), ("Dips", "TF", "3", restToDo)],
            [(overheadPress.name, "6-8", "3", overheadPress), ("Lateral Raises", "10", "3", restToDo), ("Rear Delt Raises", "10", "3", restToDo), ("Suicide Raises", "10", "3", restToDo), ("Cable Lat Raises", "TF", "3", restToDo)],
            [("Rest", "", "",restToDo)],
            [(sprints.name, "TF", "3", sprints), ("Crunches", "20-25", "3", restToDo), ("Leg Raises", "20-25", "3", restToDo), ("Toe Touches", "20-25", "3", restToDo), ("Sit-Ups", "20-25", "3", restToDo)]]
        
        let buildMuscleWorkouts: [[(String, String, String, Exercise)]] = [
            [(deadlift.name, "5", "5", deadlift), ("Lat Pulldown", "6-8", "3", restToDo), ("T-Bar Rows", "5" ,"5", restToDo), ("Bicep Curls", "6-8", "3", restToDo), ("Bicep Burnouts", "TF" , "3", restToDo)],
            [(squat.name, "5", "5", squat), ("Leg Press", "6-8", "3", restToDo), ("Leg Extensions", "12", "3", restToDo), ("Leg Curl", "12", "3", restToDo), ("Calf Raises", "20", "3", restToDo)],
            [("Rest", "", "", restToDo)],
            [(benchPress.name, "5", "5", benchPress), ("Chest Flys", "12", "3", restToDo), ("Tricep Extensions", "6-8", "3", restToDo), ("Tricep Kickbacks", "12", "3", restToDo), ("Dips", "TF", "3", restToDo)],
            [(overheadPress.name, "5", "5", overheadPress), ("Lateral Raises", "8", "3", restToDo), ("Rear Delt Raises", "8", "3", restToDo), ("Suicide Raises", "8", "3", restToDo), ("Cable Lat Raises", "TF", "3", restToDo)],
            [("Rest", "", "", restToDo)],
            [(sprints.name, "TF", "3", sprints), ("Crunches", "20-25", "3", restToDo), ("Leg Raises", "20-25", "3", restToDo), ("Toe Touches", "20-25", "3", restToDo), ("Sit-Ups", "20-25", "3", restToDo)]]
        
        if goal == "loseWeight" {
            return loseWeightWorkouts
        } else if goal == "maintainWeight" {
            return maintainWeightWorkouts
        } else {
            return buildMuscleWorkouts
        }
    }
    
}
