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
        Hey There!
        How Are You Doing Today?
        We have brought you an amazing application to track your expenses.
        Using this app will enable you to limit your budget as you want and as the days pass you can enter your expenses in the app.
        This will help you remind of over-spending and at the same time you can analyze your budget & expenses with the help of charts.
        Give It a try!
        We Hope you Enjoy It!
        """
        
        imgLogo.layer.cornerRadius = imgLogo.frame.size.width/2
        
        super.viewDidLoad()
        
        if(defaults.bool(forKey: "isProceed")) {
            if let homeVC = storyboard?.instantiateViewController(withIdentifier: "tabBarVC") as? TabBarViewController {

                navigationController?.pushViewController(homeVC, animated: false)

            }
        }
        
    }

    @IBAction func btnAgreeTapped(_ sender: Any) {
        defaults.set(true, forKey: "isProceed")
        
        let budget1 = Budget(context: Global.context)
        budget1.name = "Food"
        budget1.amount = 350
        
        let budget2 = Budget(context: Global.context)
        budget2.name = "Family"
        budget2.amount = 500
        
        let budget3 = Budget(context: Global.context)
        budget3.name = "Partying"
        budget3.amount = 350
        
        let budget4 = Budget(context: Global.context)
        budget4.name = "Gadgets"
        budget4.amount = 100
        
        let budget5 = Budget(context: Global.context)
        budget5.name = "Other"
        budget5.amount = 350
        
        let expense1 = Expense(context: Global.context)
        expense1.name = "Food"
        expense1.amount = 0
        
        let expense2 = Expense(context: Global.context)
        expense2.name = "Family"
        expense2.amount = 0
        
        let expense3 = Expense(context: Global.context)
        expense3.name = "Partying"
        expense3.amount = 0
        
        let expense4 = Expense(context: Global.context)
        expense4.name = "Gadgets"
        expense4.amount = 0
        
        let expense5 = Expense(context: Global.context)
        expense5.name = "Other"
        expense5.amount = 0
        
        do {
            try Global.context.save()
        } catch {
            print("Error occured while adding initial values to Budget and Expenses")
        }
        
    }
}

