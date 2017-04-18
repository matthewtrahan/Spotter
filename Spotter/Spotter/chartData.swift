//
//  chartData.swift
//  Spotter
//
//  Created by Matthew Trahan on 4/18/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class ChartData: Object {
    dynamic var weight: Int = Int(0)
    dynamic var reps: Int = Int(0)
    dynamic var date: Date = Date()
    
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
}
