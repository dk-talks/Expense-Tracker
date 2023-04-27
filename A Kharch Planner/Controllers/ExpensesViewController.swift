//
//  ExpensesViewController.swift
//  A Kharch Planner
//
//  Created by Dinesh Sharma on 26/04/23.
//

import UIKit
import CoreData

class ExpensesViewController: UIViewController {
    
    var allExpenses: [Expense] = []
    let formatter = NumberFormatter()
    
    
    @IBOutlet weak var tableViewExpense: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 2

        fetchExpenses()
        
        tableViewExpense.delegate = self
        tableViewExpense.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let selectedIndexPath = tableViewExpense.indexPathForSelectedRow {
            let section = selectedIndexPath.section
            
            if(Global.updateType == .Add) {
                allExpenses[section].amount += Global.updateAmount
            } else {
                allExpenses[section].amount -= Global.updateAmount
            }
            saveExepenses()
            fetchExpenses()
        
            tableViewExpense.deselectRow(at: selectedIndexPath, animated: true)
        }
        
        
    }
    
    public func fetchExpenses() {
        let request: NSFetchRequest = Expense.fetchRequest()
        do {
            allExpenses = try Global.context.fetch(request)
        } catch {
            print("error in fetching expenses: \(error.localizedDescription)")
        }
        tableViewExpense.reloadData()
    }
    
    private func saveExepenses() {
        do {
            try Global.context.save()
        } catch {
            print("error in saving budget to lcal storage: \(error)")
        }
    }

    

}


extension ExpensesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toUpdateExpense", sender: self)
    }
    
    
}

extension ExpensesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return allExpenses.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableViewExpense.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath) as? ExpenseTableViewCell else {
            return UITableViewCell()
        }
        cell.lblExpenseCategory.text = allExpenses[indexPath.section].name
        cell.lblExpenseAmount.text = formatter.string(from: allExpenses[indexPath.section].amount as NSNumber)
        
        return cell
        
    }
    
    
}

