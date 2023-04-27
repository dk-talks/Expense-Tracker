//
//  UpdateEntryViewController.swift
//  A Kharch Planner
//
//  Created by Dinesh Sharma on 26/04/23.
//

import UIKit

class UpdateEntryViewController: UIViewController {
    
    
    @IBOutlet weak var viewPopup: UIView!
    @IBOutlet weak var imgAdd: UIImageView!
    @IBOutlet weak var imgMinus: UIImageView!
    @IBOutlet weak var txtAmount: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)

        viewPopup.layer.cornerRadius = 10
        if #available(iOS 13.0, *) {
            viewPopup.layer.borderColor = UIColor.label.cgColor
        } else {
            viewPopup.layer.borderColor = UIColor.darkGray.cgColor
        }
        viewPopup.layer.borderWidth = 2
        
        imgAdd.layer.cornerRadius = imgAdd.frame.width/2
        imgAdd.layer.borderWidth = 2
        imgAdd.layer.borderColor = UIColor.green.cgColor
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        if touch.view == imgAdd {
            print("add button is tappe")
            imgAdd.layer.cornerRadius = imgAdd.frame.width/2
            imgAdd.layer.borderWidth = 2
            imgAdd.layer.borderColor = UIColor.green.cgColor
            
            imgMinus.layer.borderWidth = 0
            
            Global.updateType = .Add
            
        } else if touch.view == imgMinus {
            print("sub button is tapped")
            imgMinus.layer.cornerRadius = imgAdd.frame.height/2
            imgMinus.layer.borderWidth = 2
            imgMinus.layer.borderColor = UIColor.red.cgColor
            
            imgAdd.layer.borderWidth = 0
            
            Global.updateType = .Sub
        } else {
            print("something else is tapped")
        }
    }

    @IBAction func btnSubmitTapped(_ sender: Any) {
        
        if let text = txtAmount.text,
           let amount = Double(text) {
            Global.updateAmount = amount
        }
        
        self.dismiss(animated: true)
    }
    
    
    @IBAction func btnCloseTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
