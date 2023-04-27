//
//  TotalExpenseViewController.swift
//  A Kharch Planner
//
//  Created by Dinesh Sharma on 26/04/23.
//

import UIKit
import CoreData

class TotalExpenseViewController: UIViewController {
    
    let formatter = NumberFormatter()
    var allExpenses: [Expense] = []
    var totalExpenses: Double = 0
    
    @IBOutlet weak var lblTotalExpense: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        
    }
    override func viewDidAppear(_ animated: Bool) {
        fetchTotalBudget()
        DispatchQueue.main.async {
            self.lblTotalExpense.text = self.formatter.string(from: self.totalExpenses as NSNumber)
        }
    }
    
    private func fetchTotalBudget() {
        
        let request:NSFetchRequest = Expense.fetchRequest()
        do {
            allExpenses = try Global.context.fetch(request)
        } catch {
            print("error in fetching budget to show amount sum: \(error.localizedDescription)")
        }
        totalExpenses = 0
        for budget in allExpenses {
            totalExpenses += budget.amount
        }
        
    }
}
