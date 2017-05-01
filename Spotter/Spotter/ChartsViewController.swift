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
        
        // show the user which exercise they are viewing
        self.navigationItem.title = (exercise?.name)!
        
        // Get the username from UserDefaults
        let defaults = UserDefaults.standard
        self.user = defaults.value(forKey: "username") as? String
        
        // for giving xAxis more meaningful data
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
        
        // use a nice color for when there's no data. this "refreshes" when going between tabs
        if chart.data == nil {
            chart.backgroundColor = getChartColor()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // match the category to the chosen exercise
    func getSelectedCategory() {
        for i in 0..<realmExercises.count {
            if ((self.exercise?.name)!) == realmExercises[i].name {
                selectedCategory = realmExercises[i]
                break
            }
        }
    }
    
    // initiate the database if needed
    func populateExercises() {

        // the database is empty, so populate it by going through the exercises
        // and making a category for them
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
    
    // pull data from the database to present it
    func updateChartWithData() {
        var dataEntries: [ChartDataEntry] = []
        let repWeights = getChartDataFromDatabase()
        
        // to keep things neat, only show the last 8 entries
        if repWeights.count > 8 {
            for i in (repWeights.count - 8)..<repWeights.count {
                //let timeIntervalForDate: TimeInterval = repWeights[i].date.timeIntervalSince1970
                let dataEntry = ChartDataEntry(x: Double(i), y: Double(repWeights[i].weight))
                dataEntries.append(dataEntry)
            }
        }
            
        // if there are less than 8 entries, show however many there are
        else {
            for i in 0..<repWeights.count {
                //let timeIntervalForDate: TimeInterval = repWeights[i].date.timeIntervalSince1970
                let dataEntry = ChartDataEntry(x: Double(i), y: Double(repWeights[i].weight))
                dataEntries.append(dataEntry)
            }
        }
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "Rep Weight")
        let chartData = LineChartData(dataSet: chartDataSet)
        
        // if there is no data, we want to give the no data message and color the chart
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
        
        // hide the redundant labels on right side of chart and meaningless xAxis data
        chart.rightAxis.drawLabelsEnabled = false
        chart.xAxis.enabled = false
        chart.chartDescription?.text = ""

//      xAxis formatting - bug in Charts pod messes up our idea
//      let xAxis = chart.xAxis
//      xAxis.valueFormatter = axisFormatDelegate
    }
    
    // go into the database and query for exercises by the logged in user
    func getChartDataFromDatabase() -> Results<ChartData> {
        do {
            let realm = try Realm()
            let predicate: NSPredicate = NSPredicate(format: "exerciseName == %@ AND user == %@", (exercise?.name)!, user!)
            return realm.objects(ChartData.self).filter(predicate)
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
    // in compliance with global app color, color the background to match the app
    func getChartColor() -> UIColor {
        if self.navigationController?.navigationBar.backgroundColor == UIColor.black {
            return UIColor.black
        } else {
            return Config.toggleColor
        }
    }

    // let the user enter in new data
    @IBAction func logData(_ sender: Any) {
        // if there is data in the text field and it is an int, create a new entry in the dbs
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
