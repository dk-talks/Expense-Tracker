//
//  GlobalObjects.swift
//  A Kharch Planner
//
//  Created by Dinesh Sharma on 26/04/23.
//

import Foundation
import UIKit
import CoreData

struct Global {
    
    static let context = (UIApplication.shared.delegate as! DataModel).persistentContainer.viewContext
    static var updateAmount: Double = 0
    
    enum UpdateType {
        case Add
        case Sub
    }
    
    static var updateType: UpdateType = .Add
    
    static var updateItemNumber: Int?
    
    static var totalBudget: Double = 0
    static var totalExpense: Double = 0
    
    static var newCategoryName: String = ""
    static var newCategoryAmount: Double = 0
    static var isNewCategoryAdded: Bool = false
    
    
}
