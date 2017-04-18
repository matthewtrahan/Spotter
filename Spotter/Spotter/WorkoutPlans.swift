//
//  WorkoutPlans.swift
//  Spotter
//
//  Created by Matthew Trahan on 3/18/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import Foundation

class WorkoutPlans {
    static let deadlift: Exercise = Exercise(name: "Deadlift", description: "The deadlift is a weight training exercise in which a loaded barbell or bar is lifted off the ground to the hips, then lowered back to the ground. It is one of the three powerlifting exercises, along with the squat and bench press.", videoLink: "-4qRntuXBSc")
    static let latPulldown: Exercise = Exercise(name: "Lat Pulldown", description: "The lat pulldown is a basic upper body strength exercise that targets the upper back. The exercise also improves stability in the lower back and core.", videoLink: "u3gQT2aMVaI")
    static let tBarRows: Exercise = Exercise(name: "T-Bar Rows", description: "The T-Bar Row is an exercise to build thickness in your back. This row variation allows you to use a neutral grip—palms facing each other—which is the biomechanically strongest position to pull from.", videoLink: "rvbjGSQ2tVE")
    static let bicepCurls: Exercise = Exercise(name: "Bicep Curls", description: "A staple exercise used to train your biceps, the bicep curl and its variations are the foundation to building bigger and stronger biceps.", videoLink: "ykJmrZ5v0Oo")
    static let bicepBurnouts: Exercise = Exercise(name: "Bicep Burnouts", description: "Burnout Sets are primarily about increasing blood flow to the muscles. Our aim here is to increase blood flow to your biceps to maximize progesss.", videoLink: "t5r0ECnk3E0")
    
    static let squat: Exercise = Exercise(name: "Squat", description: "The squat is a compound, full body exercise that trains primarily the muscles of the thighs, hips, buttocks, quadriceps, and hamstrings, as well as strengthening the bones, ligaments and insertion of the tendons throughout the lower body.", videoLink: "tVB1q8zkP3o")
    static let legPress: Exercise = Exercise(name: "Leg Press", description: "The leg press is a weight training exercise in which the individual pushes a weight or resistance away from them using their legs. The leg press can be used to evaluate an athlete's overall lower body strength (from knee joint to hip).", videoLink: "Aq5uxXrXq7c")
    static let legExtensions: Exercise = Exercise(name: "Leg Extensions", description: "The leg extension is a resistance weight training exercise that targets the quadriceps muscle in the legs. The exercise is done using a machine called the Leg Extension Machine.", videoLink: "YyvSfVjQeL0")
    static let legCurls: Exercise = Exercise(name: "Leg Curls", description: "The leg curl is an isolation exercise that targets the hamstring muscles. The exercise involves flexing the lower leg against resistance towards the buttocks.", videoLink: "ELOCsoDSmrg")
    static let calfRaises: Exercise = Exercise(name: "Calf Raises", description: "The calf raise exercise targets your calf muscles, particularly the larger, outermost muscle that is responsible for the shape and size of your calves.", videoLink: "-M4-G8p8fmc")
    
    static let benchPress: Exercise = Exercise(name: "Bench Press", description: "The bench press is an upper body strength training exercise that consists of pressing a weight upwards from a supine position. A barbell is generally used to hold the weight, but a pair of dumbbells can also be used.", videoLink: "gRVjAtPip0Y")
    static let chestFlys: Exercise = Exercise(name: "Chest Flys", description: "The chest fly is a great exercise to strengthen and tone the muscles of the chest. ", videoLink: "ajdFwa-qM98")
    static let tricepExtensions: Exercise = Exercise(name: "Tricep Extensions", description: "The tricep extension is a single-joint exercise that targets the triceps, the muscles on the back of your upper arm.", videoLink: "_gsUck-7M74")
    static let tricepKickbacks: Exercise = Exercise(name: "Tricep Kickbacks", description: "The tricep kickback is a single-joint exercise that targets one group of arm muscles -- the triceps on the back of the upper arm.", videoLink: "ZO81bExngMI")
    static let dips: Exercise = Exercise(name: "Dips", description: "A dip is a compound, push-type exercise which works a large number of muscles in your chest, shoulders, and arms at the same time.", videoLink: "mRbsqry4frI")
    
    static let overheadPress: Exercise = Exercise(name: "Overhead Press", description: "The Overhead Press is a full body, compound exercise. Your shoulders and arms press the weight over your head while your legs, lower back and abs balance you.", videoLink: "F3QY5vMz_6I")
    static let lateralRaises: Exercise = Exercise(name: "Lateral Raises", description: "The lateral raise also works the muscles that support and stabilize your shoulders. It enhances your physique's appearance by creating size contrasts between your shoulders, waist and hips.", videoLink: "geenhiHju-o")
    static let rearDeltRaises: Exercise = Exercise(name: "Rear Delt Raises", description: "This exercise is an isolation exercise that heavily works the posterior deltoid muscle.", videoLink: "CgUN-WxIm44")
    static let frontRaises: Exercise = Exercise(name: "Front Raises", description: "Exercise that puts emphasis on the front delt.", videoLink: "-t7fuZ0KhDA")
    static let cableLatRaises: Exercise = Exercise(name: "Cable Lateral Raises", description: "An isolated shoulder exercise that targets the deltoids, while increasing stability in both the wrists and the core.", videoLink: "FGU9j1P5L-w")
    
    static let sprints: Exercise = Exercise(name: "Sprints", description: "Sprint training is an excellent way to build muscle, burn fat and calories, and raise your metabolic rate", videoLink: "Oy3RWqqlMTg")
    static let crunches: Exercise = Exercise(name: "Crunches", description: "The crunch is one of the most common abdominal exercises. It primarily works the rectus abdominis muscle and also works the obliques.", videoLink: "Xyd_fa5zoEU")
    static let legRaises: Exercise = Exercise(name: "Leg Raises", description: "The leg raise is the perfect exercise for the somewhat neglected lower abdominals and hip flexors. Regular performance of leg raises can help to strengthen the lower back and therefore reduce the risk of injuries.", videoLink: "JB2oyawG9KI")
    static let toeTouches: Exercise = Exercise(name: "Toe Touches", description: " The toe touch works the middle and upper region of your ab muscles. Although it alone won't give you a six-pack, it does work the muscle responsible for that cut look.", videoLink: "y6Bv_0Shhc8")
    static
    let sitUps: Exercise = Exercise(name: "Sit Ups", description: "The sit up is an exercise in which you lie on your back and use your stomach muscles to raise the top part of your body to a sitting position.", videoLink: "1fbU_MkV7NE")
    
    let rest: Exercise = Exercise(name: "Rest", description: "It is rest that makes you stronger, because it is the rest that allows the muscles that you have broken down to heal and recover. It is the rest that allows you to recover so you can be strong, and thereby handle the increased weight, and increased number of sets and reps needed to progress further.", videoLink: "")
    
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
            [(WorkoutPlans.deadlift.name, "12", "3", WorkoutPlans.deadlift), (WorkoutPlans.latPulldown.name, "10-12", "3", WorkoutPlans.latPulldown), (WorkoutPlans.tBarRows.name, "10-12" ,"3", WorkoutPlans.tBarRows), (WorkoutPlans.bicepCurls.name, "15", "3", WorkoutPlans.bicepCurls), (WorkoutPlans.bicepBurnouts.name, "TF" , "3", WorkoutPlans.bicepBurnouts)],
            [(WorkoutPlans.squat.name, "12", "3", WorkoutPlans.squat), (WorkoutPlans.legPress.name, "15", "3", WorkoutPlans.legPress), (WorkoutPlans.legExtensions.name, "12", "3", WorkoutPlans.legExtensions), (WorkoutPlans.legCurls.name, "12", "3", WorkoutPlans.legCurls), (WorkoutPlans.calfRaises.name, "20", "3", WorkoutPlans.calfRaises)],
            [(rest.name, "", "", rest)],
            [(WorkoutPlans.benchPress.name, "12", "3", WorkoutPlans.benchPress), (WorkoutPlans.chestFlys.name, "12", "3", WorkoutPlans.chestFlys), (WorkoutPlans.tricepExtensions.name, "15", "3", WorkoutPlans.tricepExtensions), (WorkoutPlans.tricepKickbacks.name, "12", "3", WorkoutPlans.tricepKickbacks), (WorkoutPlans.dips.name, "TF", "3", WorkoutPlans.dips)],
            [(WorkoutPlans.overheadPress.name, "12", "3", WorkoutPlans.overheadPress), (WorkoutPlans.lateralRaises.name, "15", "3", WorkoutPlans.lateralRaises), (WorkoutPlans.rearDeltRaises.name, "15", "3", WorkoutPlans.rearDeltRaises), (WorkoutPlans.frontRaises.name, "15", "3", WorkoutPlans.frontRaises), (WorkoutPlans.cableLatRaises.name, "TF", "3", WorkoutPlans.cableLatRaises)],
            [(rest.name, "", "", rest)],
            [(WorkoutPlans.sprints.name, "TF", "3", WorkoutPlans.sprints), (WorkoutPlans.crunches.name, "20-25", "3", WorkoutPlans.crunches), (WorkoutPlans.legRaises.name, "20-25", "3", WorkoutPlans.legRaises), (WorkoutPlans.toeTouches.name, "20-25", "3", WorkoutPlans.toeTouches), (WorkoutPlans.sitUps.name, "20-25", "3", WorkoutPlans.sitUps)]]

        let maintainWeightWorkouts: [[(String, String, String, Exercise)]] = [
            [(WorkoutPlans.deadlift.name, "8", "3", WorkoutPlans.deadlift), (WorkoutPlans.latPulldown.name, "6-8", "3",WorkoutPlans.latPulldown), (WorkoutPlans.tBarRows.name, "6-8" ,"3", WorkoutPlans.tBarRows), (WorkoutPlans.bicepCurls.name, "8-10", "3", WorkoutPlans.bicepCurls), (WorkoutPlans.bicepBurnouts.name, "TF" , "3", WorkoutPlans.bicepBurnouts)],
            [(WorkoutPlans.squat.name, "6-8", "3", WorkoutPlans.squat), (WorkoutPlans.legPress.name, "6-8", "3", WorkoutPlans.legPress), (WorkoutPlans.legExtensions.name, "12", "3", WorkoutPlans.legExtensions), (WorkoutPlans.legCurls.name, "12", "3", WorkoutPlans.legCurls), (WorkoutPlans.calfRaises.name, "20", "3", WorkoutPlans.calfRaises)],
            [(rest.name, "", "", rest)],
            [(WorkoutPlans.benchPress.name, "6-8", "3", WorkoutPlans.benchPress), (WorkoutPlans.chestFlys.name, "12", "3", WorkoutPlans.chestFlys), (WorkoutPlans.tricepExtensions.name, "10", "3", WorkoutPlans.tricepExtensions), (WorkoutPlans.tricepKickbacks.name, "12", "3", WorkoutPlans.tricepKickbacks), (WorkoutPlans.dips.name, "TF", "3", WorkoutPlans.dips)],
            [(WorkoutPlans.overheadPress.name, "6-8", "3", WorkoutPlans.overheadPress), (WorkoutPlans.lateralRaises.name, "10", "3", WorkoutPlans.lateralRaises), (WorkoutPlans.rearDeltRaises.name, "10", "3", WorkoutPlans.rearDeltRaises), (WorkoutPlans.frontRaises.name, "10", "3", WorkoutPlans.frontRaises), (WorkoutPlans.cableLatRaises.name, "TF", "3", WorkoutPlans.cableLatRaises)],
            [(rest.name, "", "",rest)],
            [(WorkoutPlans.sprints.name, "TF", "3", WorkoutPlans.sprints), (WorkoutPlans.crunches.name, "20-25", "3", WorkoutPlans.crunches), (WorkoutPlans.legRaises.name, "20-25", "3", WorkoutPlans.legRaises), (WorkoutPlans.toeTouches.name, "20-25", "3", WorkoutPlans.toeTouches), (WorkoutPlans.sitUps.name, "20-25", "3", WorkoutPlans.sitUps)]]
        
        let buildMuscleWorkouts: [[(String, String, String, Exercise)]] = [
            [(WorkoutPlans.deadlift.name, "5", "5", WorkoutPlans.deadlift), (WorkoutPlans.latPulldown.name, "6-8", "3", WorkoutPlans.latPulldown), (WorkoutPlans.tBarRows.name, "5" ,"5", WorkoutPlans.tBarRows), (WorkoutPlans.bicepCurls.name, "6-8", "3", WorkoutPlans.bicepCurls), (WorkoutPlans.bicepBurnouts.name, "TF" , "3", WorkoutPlans.bicepBurnouts)],
            [(WorkoutPlans.squat.name, "5", "5", WorkoutPlans.squat), (WorkoutPlans.legPress.name, "6-8", "3", WorkoutPlans.legPress), (WorkoutPlans.legExtensions.name, "12", "3", WorkoutPlans.legExtensions), (WorkoutPlans.legCurls.name, "12", "3", WorkoutPlans.legCurls), (WorkoutPlans.calfRaises.name, "20", "3", WorkoutPlans.calfRaises)],
            [(rest.name, "", "", rest)],
            [(WorkoutPlans.benchPress.name, "5", "5", WorkoutPlans.benchPress), (WorkoutPlans.chestFlys.name, "12", "3", WorkoutPlans.chestFlys), (WorkoutPlans.tricepExtensions.name, "6-8", "3", WorkoutPlans.tricepExtensions), (WorkoutPlans.tricepKickbacks.name, "12", "3", WorkoutPlans.tricepKickbacks), (WorkoutPlans.dips.name, "TF", "3", WorkoutPlans.dips)],
            [(WorkoutPlans.overheadPress.name, "5", "5", WorkoutPlans.overheadPress), (WorkoutPlans.lateralRaises.name, "8", "3", WorkoutPlans.lateralRaises), (WorkoutPlans.rearDeltRaises.name, "8", "3", WorkoutPlans.rearDeltRaises), (WorkoutPlans.frontRaises.name, "8", "3", WorkoutPlans.frontRaises), (WorkoutPlans.cableLatRaises.name, "TF", "3", WorkoutPlans.cableLatRaises)],
            [(rest.name, "", "", rest)],
            [(WorkoutPlans.sprints.name, "TF", "3", WorkoutPlans.sprints), (WorkoutPlans.crunches.name, "20-25", "3", WorkoutPlans.crunches), (WorkoutPlans.legRaises.name, "20-25", "3", WorkoutPlans.legRaises), (WorkoutPlans.toeTouches.name, "20-25", "3", WorkoutPlans.toeTouches), (WorkoutPlans.sitUps.name, "20-25", "3", WorkoutPlans.sitUps)]]
        
        if goal == "loseWeight" {
            return loseWeightWorkouts
        } else if goal == "maintainWeight" {
            return maintainWeightWorkouts
        } else {
            return buildMuscleWorkouts
        }
    }
    
    static func getDictOfExercises() -> [String: [Exercise]] {
        let exercises: [String: [Exercise]] = ["Back": [WorkoutPlans.deadlift, WorkoutPlans.latPulldown, WorkoutPlans.tBarRows],
                                               "Biceps": [WorkoutPlans.bicepCurls, WorkoutPlans.bicepBurnouts],
                                               "Legs": [WorkoutPlans.squat, WorkoutPlans.legPress, WorkoutPlans.legExtensions, WorkoutPlans.legCurls, WorkoutPlans.calfRaises],
                                               "Chest": [WorkoutPlans.benchPress, WorkoutPlans.chestFlys],
                                               "Triceps": [WorkoutPlans.tricepExtensions, WorkoutPlans.tricepKickbacks, WorkoutPlans.dips],
                                               "Shoulders": [WorkoutPlans.overheadPress, WorkoutPlans.lateralRaises, WorkoutPlans.rearDeltRaises, WorkoutPlans.frontRaises, WorkoutPlans.cableLatRaises]]
        return exercises
    }
    
}
