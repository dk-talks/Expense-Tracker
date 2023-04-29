//
//  ViewController.swift
//  A Kharch Planner
//
//  Created by Dinesh Sharma on 26/04/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imgLogo: UIImageView!
    
    @IBOutlet weak var txtView: UITextView!
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        
        txtView.text = """
        Introducing our new expense management app, designed to help you take control of your finances and manage your budget with ease. Our app is perfect for anyone who wants to keep track of their expenses, set a budget, and make informed financial decisions.

        With our app, you can easily input all of your income and expenses, and categorize them as necessary. Our simple and intuitive interface makes it easy to add new transactions and keep track of your spending in real-time. You can also set a budget for each category and receive notifications when you are getting close to your limit.

        Our app provides detailed reports and visual representations of your spending habits. You can see how much money you spend in each category, how much you have left in your budget, and how your spending habits have changed over time. With this information, you can make informed decisions about how to adjust your spending and manage your finances more effectively.

        Download our app today and take the first step towards a more organized and financially stable future.
        """
        
        imgLogo.layer.cornerRadius = imgLogo.frame.size.width/2
        
        super.viewDidLoad()
        
        if(defaults.bool(forKey: "isProceed")) {
            if let homeVC = storyboard?.instantiateViewController(withIdentifier: "tabBarVC") as? TabBarViewController {

                navigationController?.pushViewController(homeVC, animated: false)

            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    @IBAction func btnAgreeTapped(_ sender: Any) {
        defaults.set(true, forKey: "isProceed")
        
        let budget1 = Budget(context: Global.context)
        budget1.name = "Other"
        budget1.amount = 0
        
        let budget2 = Budget(context: Global.context)
        budget2.name = "Stay"
        budget2.amount = 0
        
        let budget5 = Budget(context: Global.context)
        budget5.name = "Food"
        budget5.amount = 0
        
        let expense1 = Expense(context: Global.context)
        expense1.name = "Other"
        expense1.amount = 0
        
        let expense2 = Expense(context: Global.context)
        expense2.name = "Stay"
        expense2.amount = 0
        
        let expense3 = Expense(context: Global.context)
        expense3.name = "Food"
        expense3.amount = 0
        
        do {
            try Global.context.save()
        } catch {
            print("Error occured while adding initial values to Budget and Expenses")
        }
        
    }
}

