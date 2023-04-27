//
//  TotalBudgetViewController.swift
//  A Kharch Planner
//
//  Created by Dinesh Sharma on 26/04/23.
//

import UIKit
import CoreData

class TotalBudgetViewController: UIViewController {
    
    let formatter = NumberFormatter()
    
    var allBudget: [Budget] = []
    var totalBudget: Double = 0
    
    @IBOutlet weak var lblMonthlyBudget: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        
    }
    override func viewDidAppear(_ animated: Bool) {
        fetchTotalBudget()
        DispatchQueue.main.async {
            self.lblMonthlyBudget.text = self.formatter.string(from: self.totalBudget as NSNumber)
        }
    }
    
    private func fetchTotalBudget() {
        
        let request:NSFetchRequest = Budget.fetchRequest()
        do {
            allBudget = try Global.context.fetch(request)
        } catch {
            print("error in fetching budget to show amount sum: \(error.localizedDescription)")
        }
        totalBudget = 0
        for budget in allBudget {
            totalBudget += budget.amount
        }
        
    }


}


