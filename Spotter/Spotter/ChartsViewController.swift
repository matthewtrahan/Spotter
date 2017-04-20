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
    @IBOutlet weak var chartTitle: UILabel!
    
    var exercise: Exercise?
    let exercises: [String: [Exercise]] = WorkoutPlans.getDictOfExercises()
    let realm = try! Realm()
    lazy var realmExercises: Results<Category> = { self.realm.objects(Category.self) }()
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        axisFormatDelegate = self
        updateChartWithData()
        chart.animate(xAxisDuration: 1.0, yAxisDuration: 1.0)
        self.chartTitle.text = exercise!.name
        populateExercises()
        
        //print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populateExercises() {
        
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
                let dataEntry = BarChartDataEntry(x: Double(i), y: Double(repWeights[i].weight))
                dataEntries.append(dataEntry)
            }
        }
        else {
            for i in 0..<repWeights.count {
                //let timeIntervalForDate: TimeInterval = repWeights[i].date.timeIntervalSince1970
                let dataEntry = BarChartDataEntry(x: Double(i), y: Double(repWeights[i].weight))
                dataEntries.append(dataEntry)
            }
        }
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "Rep Weight")
        let chartData = LineChartData(dataSet: chartDataSet)
        chart.data = chartData
        chart.noDataText = "No data available."
        
        chart.rightAxis.drawLabelsEnabled = false
        chart.xAxis.enabled = false
        
//        let xAxis = chart.xAxis
//        xAxis.valueFormatter = axisFormatDelegate
    
        chart.chartDescription?.text = ""
        chart.xAxis.labelPosition = .bottom
    }
    
    func getChartDataFromDatabase() -> Results<ChartData> {
        do {
            let realm = try Realm()
            return realm.objects(ChartData.self)
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }

    @IBAction func logData(_ sender: Any) {
        if let value = weightTextField.text , value != "" {
            let weight = ChartData()
            weight.weight = (NumberFormatter().number(from: value)?.intValue)!
            weight.exerciseName = exercise!.name
            weight.save()
            weightTextField.text = ""
        }
        updateChartWithData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: axisFormatDelegate
extension UIViewController: IAxisValueFormatter {
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        
        // for presentation
        //dateFormatter.dateFormat = "hh:mm.ss"
        
        return dateFormatter.string(from: Date(timeIntervalSince1970: (value)))
    }
}
