//
//  AddCategoryViewController.swift
//  A Kharch Planner
//
//  Created by Dinesh Sharma on 27/04/23.
//

import UIKit

class AddCategoryViewController: UIViewController {
    
    @IBOutlet weak var txtCategoryName: UITextField!
    
    @IBOutlet weak var txtCategoryInitialAmount: UITextField!

    @IBOutlet weak var viewPopup: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)

        viewPopup.layer.cornerRadius = 20
        if #available(iOS 13.0, *) {
            viewPopup.layer.borderColor = UIColor.label.cgColor
        } else {
            viewPopup.layer.borderColor = UIColor.darkGray.cgColor
        }
        viewPopup.layer.borderWidth = 2
        

        
    }
    
    @IBAction func btnAddNowTapped(_ sender: Any) {
        if let text = txtCategoryInitialAmount.text,
           let amount = Double(text),
           let name = txtCategoryName.text,
           !name.isEmpty
        {
            Global.newCategoryName = name
            Global.newCategoryAmount = amount
            Global.isNewCategoryAdded = true
        } else {
            Global.isNewCategoryAdded = false
        }
        
        self.dismiss(animated: true)
    }
    
    
    @IBAction func btnCloseTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
