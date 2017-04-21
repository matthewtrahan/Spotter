//
//  ChartsViewController.swift
//  Spotter
//
//  Created by Matthew Trahan on 4/14/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

class ChartsViewController: UIViewController {

    @IBOutlet weak var chart: LineChartView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    var exercise: Exercise?
    let exercises: [String: [Exercise]] = WorkoutPlans.getDictOfExercises()
    let realm = try! Realm()
    lazy var realmExercises: Results<Category> = {self.realm.objects(Category.self)}()
    weak var axisFormatDelegate: IAxisValueFormatter?
    var selectedCategory: Category?
    var user: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = (exercise?.name)!
        
        let defaults = UserDefaults.standard
        
        // Get the username from UserDefaults
        self.user = defaults.value(forKey: "username") as? String
        
        axisFormatDelegate = self
        updateChartWithData()
        chart.animate(xAxisDuration: 0.0, yAxisDuration: 1.0)
        
        weightTextField.keyboardType = .numberPad
        populateExercises()
        getSelectedCategory()

        // print location for viewing in realm browser
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if chart.data == nil {
            chart.backgroundColor = getChartColor()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getSelectedCategory() {
        for i in 0..<realmExercises.count {
            if ((self.exercise?.name)!) == realmExercises[i].name {
                selectedCategory = realmExercises[i]
                break
            }
        }
    }
    
    func populateExercises() {
        
        // the database is empty, so populate it
        if realmExercises.count == 0 {
            try! realm.write() {
                for (_, exercise) in exercises {
                    for i in 0..<exercise.count {
                        let newCategory = Category()
                        newCategory.name = exercise[i].name
                        self.realm.add(newCategory)
                    }
                }
            }
            realmExercises = realm.objects(Category.self)
        }
    }
    
    func updateChartWithData() {
        var dataEntries: [ChartDataEntry] = []
        let repWeights = getChartDataFromDatabase()
        if repWeights.count > 8 {
            for i in (repWeights.count - 8)..<repWeights.count {
                //let timeIntervalForDate: TimeInterval = repWeights[i].date.timeIntervalSince1970
                let dataEntry = ChartDataEntry(x: Double(i), y: Double(repWeights[i].weight))
                dataEntries.append(dataEntry)
            }
        }
        else {
            for i in 0..<repWeights.count {
                //let timeIntervalForDate: TimeInterval = repWeights[i].date.timeIntervalSince1970
                let dataEntry = ChartDataEntry(x: Double(i), y: Double(repWeights[i].weight))
                dataEntries.append(dataEntry)
            }
        }
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "Rep Weight")
        let chartData = LineChartData(dataSet: chartDataSet)
        
        if chartData.entryCount > 0 {
            chart.data = chartData
        } else {
            chart.backgroundColor = getChartColor()
            chart.noDataTextColor = .white
            chart.noDataFont = UIFont(name: chart.noDataFont.fontName, size: 17.0)
        }
        
        // no data text
        chart.noDataText = "No data available."
        // user interaction
        chart.isUserInteractionEnabled = false
        
        chart.rightAxis.drawLabelsEnabled = false
        chart.xAxis.enabled = false

//      let xAxis = chart.xAxis
//      xAxis.valueFormatter = axisFormatDelegate
  
        chart.chartDescription?.text = ""
    }
    
    func getChartDataFromDatabase() -> Results<ChartData> {
        do {
            let realm = try Realm()
            let predicate: NSPredicate = NSPredicate(format: "exerciseName == %@ AND user == %@", (exercise?.name)!, user!)
            return realm.objects(ChartData.self).filter(predicate)
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
    func getChartColor() -> UIColor {
        if self.navigationController?.navigationBar.backgroundColor == UIColor.black {
            return UIColor.black
        } else {
            return Config.toggleColor
        }
    }

    @IBAction func logData(_ sender: Any) {
        if let value = weightTextField.text , value != "", weightTextField.text?.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil {
            chart.backgroundColor = UIColor.white
            let weight = ChartData()
            weight.weight = (NumberFormatter().number(from: value)?.intValue)!
            weight.exerciseName = exercise!.name
            weight.category = selectedCategory
            weight.user = user!
            weight.save()
            weightTextField.text = ""
        }
        updateChartWithData()
    }

}

// MARK: axisFormatDelegate
extension UIViewController: IAxisValueFormatter {
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        
        return dateFormatter.string(from: Date(timeIntervalSince1970: (value)))
    }
}
