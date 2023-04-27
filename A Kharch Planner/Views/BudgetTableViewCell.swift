//
//  BudgetTableViewCell.swift
//  A Kharch Planner
//
//  Created by Dinesh Sharma on 26/04/23.
//

import UIKit

class BudgetTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblBudgetCategory: UILabel!
    @IBOutlet weak var lblBudgetAmount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
