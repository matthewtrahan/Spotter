//
//  WorkoutPlans.swift
//  Spotter
//
//  Created by Matthew Trahan on 3/18/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import Foundation

class WorkoutPlans {
    let deadlift: Exercise = Exercise(name: "Deadlift", description: "The deadlift is a weight training exercise in which a loaded barbell or bar is lifted off the ground to the hips, then lowered back to the ground. It is one of the three powerlifting exercises, along with the squat and bench press.", videoLink: "-4qRntuXBSc")
    let latPulldown: Exercise = Exercise(name: "Lat Pulldown", description: "The lat pulldown is a basic upper body strength exercise that targets the upper back. The exercise also improves stability in the lower back and core.", videoLink: "u3gQT2aMVaI")
    let tBarRows: Exercise = Exercise(name: "T-Bar Rows", description: "The T-Bar Row is an exercise to build thickness in your back. This row variation allows you to use a neutral grip—palms facing each other—which is the biomechanically strongest position to pull from.", videoLink: "rvbjGSQ2tVE")
    let bicepCurls: Exercise = Exercise(name: "Bicep Curls", description: "A staple exercise used to train your biceps, the bicep curl and its variations are the foundation to building bigger and stronger biceps.", videoLink: "ykJmrZ5v0Oo")
    let bicepBurnouts: Exercise = Exercise(name: "Bicep Burnouts", description: "Burnout Sets are primarily about increasing blood flow to the muscles. Our aim here is to increase blood flow to your biceps to maximize progesss.", videoLink: "t5r0ECnk3E0")
    
    let squat: Exercise = Exercise(name: "Squat", description: "The squat is a compound, full body exercise that trains primarily the muscles of the thighs, hips, buttocks, quadriceps, and hamstrings, as well as strengthening the bones, ligaments and insertion of the tendons throughout the lower body.", videoLink: "tVB1q8zkP3o")
    let legPress: Exercise = Exercise(name: "Leg Press", description: "The leg press is a weight training exercise in which the individual pushes a weight or resistance away from them using their legs. The leg press can be used to evaluate an athlete's overall lower body strength (from knee joint to hip).", videoLink: "Aq5uxXrXq7c")
    let legExtensions: Exercise = Exercise(name: "Leg Extensions", description: "The leg extension is a resistance weight training exercise that targets the quadriceps muscle in the legs. The exercise is done using a machine called the Leg Extension Machine.", videoLink: "YyvSfVjQeL0")
    let legCurls: Exercise = Exercise(name: "Leg Curls", description: "The leg curl is an isolation exercise that targets the hamstring muscles. The exercise involves flexing the lower leg against resistance towards the buttocks.", videoLink: "ELOCsoDSmrg")
    let calfRaises: Exercise = Exercise(name: "Calf Raises", description: "The calf raise exercise targets your calf muscles, particularly the larger, outermost muscle that is responsible for the shape and size of your calves.", videoLink: "-M4-G8p8fmc")
    
    let benchPress: Exercise = Exercise(name: "Bench Press", description: "The bench press is an upper body strength training exercise that consists of pressing a weight upwards from a supine position. A barbell is generally used to hold the weight, but a pair of dumbbells can also be used.", videoLink: "gRVjAtPip0Y")
    let chestFlys: Exercise = Exercise(name: "Chest Flys", description: "The chest fly is a great exercise to strengthen and tone the muscles of the chest. ", videoLink: "ajdFwa-qM98")
    let tricepExtensions: Exercise = Exercise(name: "Tricep Extensions", description: "The tricep extension is a single-joint exercise that targets the triceps, the muscles on the back of your upper arm.", videoLink: "_gsUck-7M74")
    let tricepKickbacks: Exercise = Exercise(name: "Tricep Kickbacks", description: "The tricep kickback is a single-joint exercise that targets one group of arm muscles -- the triceps on the back of the upper arm.", videoLink: "ZO81bExngMI")
    let dips: Exercise = Exercise(name: "Dips", description: "A dip is a compound, push-type exercise which works a large number of muscles in your chest, shoulders, and arms at the same time.", videoLink: "mRbsqry4frI")
    
    let overheadPress: Exercise = Exercise(name: "Overhead Press", description: "The Overhead Press is a full body, compound exercise. Your shoulders and arms press the weight over your head while your legs, lower back and abs balance you.", videoLink: "F3QY5vMz_6I")
    let lateralRaises: Exercise = Exercise(name: "Lateral Raises", description: "The lateral raise also works the muscles that support and stabilize your shoulders. It enhances your physique's appearance by creating size contrasts between your shoulders, waist and hips.", videoLink: "geenhiHju-o")
    let rearDeltRaises: Exercise = Exercise(name: "Rear Delt Raises", description: "This exercise is an isolation exercise that heavily works the posterior deltoid muscle.", videoLink: "CgUN-WxIm44")
    let frontRaises: Exercise = Exercise(name: "Front Raises", description: "Exercise that puts emphasis on the front delt.", videoLink: "-t7fuZ0KhDA")
    let cableLatRaises: Exercise = Exercise(name: "Cable Lateral Raises", description: " An isolated shoulder exercise that targets the deltoids, while increasing stability in both the wrists and the core.", videoLink: "FGU9j1P5L-w")
    
    let sprints: Exercise = Exercise(name: "Sprints", description: "Sprint training is an excellent way to build muscle, burn fat and calories, and raise your metabolic rate", videoLink: "Oy3RWqqlMTg")
    let crunches: Exercise = Exercise(name: "Crunches", description: "The crunch is one of the most common abdominal exercises. It primarily works the rectus abdominis muscle and also works the obliques.", videoLink: "Xyd_fa5zoEU")
    let legRaises: Exercise = Exercise(name: "Leg Raises", description: "The leg raise is the perfect exercise for the somewhat neglected lower abdominals and hip flexors. Regular performance of leg raises can help to strengthen the lower back and therefore reduce the risk of injuries.", videoLink: "JB2oyawG9KI")
    let toeTouches: Exercise = Exercise(name: "Toe Touches", description: " The toe touch works the middle and upper region of your ab muscles. Although it alone won't give you a six-pack, it does work the muscle responsible for that cut look.", videoLink: "y6Bv_0Shhc8")
    let sitUps: Exercise = Exercise(name: "Sit Ups", description: "The sit up is an exercise in which you lie on your back and use your stomach muscles to raise the top part of your body to a sitting position.", videoLink: "1fbU_MkV7NE")
    
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
            [(deadlift.name, "12", "3", deadlift), (latPulldown.name, "10-12", "3", latPulldown), (tBarRows.name, "10-12" ,"3", tBarRows), (bicepCurls.name, "15", "3", bicepCurls), (bicepBurnouts.name, "TF" , "3", bicepBurnouts)],
            [(squat.name, "12", "3", squat), (legPress.name, "15", "3", legPress), (legExtensions.name, "12", "3", legExtensions), (legCurls.name, "12", "3", legCurls), (calfRaises.name, "20", "3", calfRaises)],
            [(restToDo.name, "", "", restToDo)],
            [(benchPress.name, "12", "3", benchPress), (chestFlys.name, "12", "3", chestFlys), (tricepExtensions.name, "15", "3", tricepExtensions), (tricepKickbacks.name, "12", "3", tricepKickbacks), (dips.name, "TF", "3", dips)],
            [(overheadPress.name, "12", "3", overheadPress), (lateralRaises.name, "15", "3", lateralRaises), (rearDeltRaises.name, "15", "3", rearDeltRaises), (frontRaises.name, "15", "3", frontRaises), (cableLatRaises.name, "TF", "3", cableLatRaises)], [(restToDo.name, "", "", restToDo)],
            [(sprints.name, "TF", "3", sprints), (crunches.name, "20-25", "3", crunches), (legRaises.name, "20-25", "3", legRaises), (toeTouches.name, "20-25", "3", toeTouches), (sitUps.name, "20-25", "3", sitUps)]]

        let maintainWeightWorkouts: [[(String, String, String, Exercise)]] = [
            [(deadlift.name, "8", "3", deadlift), (latPulldown.name, "6-8", "3",latPulldown), (tBarRows.name, "6-8" ,"3",tBarRows), (bicepCurls.name, "8-10", "3", bicepCurls), (bicepBurnouts.name, "TF" , "3", bicepBurnouts)],
            [(squat.name, "6-8", "3", squat), (legPress.name, "6-8", "3", legPress), (legExtensions.name, "12", "3", legExtensions), (legCurls.name, "12", "3", legCurls), (calfRaises.name, "20", "3", calfRaises)],
            [(restToDo.name, "", "", restToDo)],
            [(benchPress.name, "6-8", "3", benchPress), (chestFlys.name, "12", "3", chestFlys), (tricepExtensions.name, "10", "3", tricepExtensions), (tricepKickbacks.name, "12", "3", tricepKickbacks), (dips.name, "TF", "3", dips)],
            [(overheadPress.name, "6-8", "3", overheadPress), (lateralRaises.name, "10", "3", lateralRaises), (rearDeltRaises.name, "10", "3", rearDeltRaises), (frontRaises.name, "10", "3", frontRaises), (cableLatRaises.name, "TF", "3", cableLatRaises)],
            [(restToDo.name, "", "",restToDo)],
            [(sprints.name, "TF", "3", sprints), (crunches.name, "20-25", "3", crunches), (legRaises.name, "20-25", "3", legRaises), (toeTouches.name, "20-25", "3", toeTouches), (sitUps.name, "20-25", "3", sitUps)]]
        
        let buildMuscleWorkouts: [[(String, String, String, Exercise)]] = [
            [(deadlift.name, "5", "5", deadlift), (latPulldown.name, "6-8", "3", latPulldown), (tBarRows.name, "5" ,"5", tBarRows), (bicepCurls.name, "6-8", "3", bicepCurls), (bicepBurnouts.name, "TF" , "3", bicepBurnouts)],
            [(squat.name, "5", "5", squat), (legPress.name, "6-8", "3", legPress), (legExtensions.name, "12", "3", legExtensions), (legCurls.name, "12", "3", legCurls), (calfRaises.name, "20", "3", calfRaises)],
            [(restToDo.name, "", "", restToDo)],
            [(benchPress.name, "5", "5", benchPress), (chestFlys.name, "12", "3", chestFlys), (tricepExtensions.name, "6-8", "3", tricepExtensions), (tricepKickbacks.name, "12", "3", tricepKickbacks), (dips.name, "TF", "3", dips)],
            [(overheadPress.name, "5", "5", overheadPress), (lateralRaises.name, "8", "3", lateralRaises), (rearDeltRaises.name, "8", "3", rearDeltRaises), (frontRaises.name, "8", "3", frontRaises), (cableLatRaises.name, "TF", "3", cableLatRaises)],
            [(restToDo.name, "", "", restToDo)],
            [(sprints.name, "TF", "3", sprints), (crunches.name, "20-25", "3", crunches), (legRaises.name, "20-25", "3", legRaises), (toeTouches.name, "20-25", "3", toeTouches), (sitUps.name, "20-25", "3", sitUps)]]
        
        if goal == "loseWeight" {
            return loseWeightWorkouts
        } else if goal == "maintainWeight" {
            return maintainWeightWorkouts
        } else {
            return buildMuscleWorkouts
        }
    }
    
}
