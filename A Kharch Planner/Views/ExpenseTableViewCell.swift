//
//  ExpenseTableViewCell.swift
//  A Kharch Planner
//
//  Created by Dinesh Sharma on 26/04/23.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblExpenseCategory: UILabel!
    @IBOutlet weak var lblExpenseAmount: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
