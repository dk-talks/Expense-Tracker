//
//  AnalyseViewController.swift
//  A Kharch Planner
//
//  Created by Dinesh Sharma on 26/04/23.
//

import UIKit
import Charts
import CoreData


class AnalyseViewController: UIViewController, ChartViewDelegate {
    
    var totalBudget: Double = 0
    var totalExpense: Double = 0
    
    let formatter = NumberFormatter()
    
    var barChart = BarChartView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        barChart.delegate = self
        
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 2
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        let budgetRequest: NSFetchRequest = Budget.fetchRequest()
        do {
            totalBudget = 0
            for item in try Global.context.fetch(budgetRequest) {
                totalBudget += item.amount
            }
        } catch {
            print(error)
        }
        print("total budget is: \(totalBudget)")
        
        let expenseRequest: NSFetchRequest = Expense.fetchRequest()
        do {
            totalExpense = 0
            for item in try Global.context.fetch(expenseRequest) {
                totalExpense += item.amount
            }
        } catch {
            print(error)
        }
        print("total expense are: \(totalExpense)")
        
        barChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        barChart.center = view.center
        view.addSubview(barChart)
        
        let leftAxis = barChart.leftAxis
        let rightAxis = barChart.rightAxis
        
        let bothAxis = [leftAxis, rightAxis]
        
        for axis in bothAxis {
            axis.axisMinimum = 0
        }
        
        // Set up data for the expense bar
        let expenseData = BarChartDataEntry(x: 1.0, y: totalExpense)
        let expenseDataSet = BarChartDataSet(entries: [expenseData], label: "Expenses")
        expenseDataSet.colors = [.red]
        
        // Set up data for the budget bar
        let budgetData = BarChartDataEntry(x: 2.0, y: totalBudget)
        let budgetDataSet = BarChartDataSet(entries: [budgetData], label: "Budget")
        budgetDataSet.colors = [.blue]
        
        // Combine the two data sets into a single data object
        let barChartData = BarChartData(dataSets: [expenseDataSet, budgetDataSet])
        
        // Configure the bar chart view
        barChart.data = barChartData
        barChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: [""])
        barChart.chartDescription?.text = "A Kharch Planner"
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        
        
        
    }
    
}
