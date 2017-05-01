//
//  chartData.swift
//  Spotter
//
//  Created by Matthew Trahan on 4/18/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//
//  The actual data point that the user adds to the chart.

import Foundation
import RealmSwift
import Realm

class ChartData: Object {
    dynamic var weight: Int = Int(0)
    dynamic var reps: Int = Int(0)
    dynamic var date: Date = Date()
    dynamic var exerciseName: String?
    dynamic var user: String?
    dynamic var category: Category!
    
    // this helper function saves all of the data to the db
    func save() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(self)
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
    func getMonthDay() -> Date {
        return Date()
    }
}
