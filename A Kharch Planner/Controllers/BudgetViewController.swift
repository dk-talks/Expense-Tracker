//
//  BudgetViewController.swift
//  A Kharch Planner
//
//  Created by Dinesh Sharma on 26/04/23.
//

import UIKit
import CoreData

class BudgetViewController: UIViewController {
    
    var allBudget: [Budget] = []
    let formatter = NumberFormatter()
    
    
    @IBOutlet weak var tableViewForBudget: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 2
        
        fetchBudget()
        
        tableViewForBudget.delegate = self
        tableViewForBudget.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let selectedIndexPath = tableViewForBudget.indexPathForSelectedRow {
            let section = selectedIndexPath.section
            
            if(Global.updateType == .Add) {
                allBudget[section].amount += Global.updateAmount
            } else {
                allBudget[section].amount -= Global.updateAmount
            }
            saveBudget()
            fetchBudget()
        
            tableViewForBudget.deselectRow(at: selectedIndexPath, animated: true)
        }
        
        if(Global.isNewCategoryAdded) {
            let newCategory = Budget(context: Global.context)
            newCategory.amount = Global.newCategoryAmount
            newCategory.name = Global.newCategoryName
            saveBudget()
            fetchBudget()
            Global.isNewCategoryAdded = false
        }
        
        
    }
    
    
    private func fetchBudget() {
        
        let request: NSFetchRequest = Budget.fetchRequest()
        do {
            allBudget = try Global.context.fetch(request)
        } catch {
            print("error in fetching budget information from local storage")
        }
        tableViewForBudget.reloadData()
    }
    
    private func saveBudget() {
        do {
            try Global.context.save()
        } catch {
            print("error in saving budget to lcal storage: \(error)")
        }
    }
    
    
    @IBAction func btnAddBudgetCategoryTapped(_ sender: Any) {
        
    }
    

}

extension BudgetViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toUpdateEntry", sender: self)
        
    }
    
    
}

extension BudgetViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return allBudget.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableViewForBudget.dequeueReusableCell(withIdentifier: "budgetCell", for: indexPath) as? BudgetTableViewCell else {
            return UITableViewCell()
        }
        cell.lblBudgetCategory.text = allBudget[indexPath.section].name
        cell.lblBudgetAmount.text = formatter.string(from: allBudget[indexPath.section].amount as NSNumber)
        
        return cell
        
    }
    
    
}
