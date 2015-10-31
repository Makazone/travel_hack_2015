//
//  ChecklistWidget.swift
//  AppInTheAirWidgetSDK
//
//  Created by Sergey Pronin on 10/23/15.
//  Copyright © 2015 App in the Air. All rights reserved.
//

import UIKit
import WidgetSDK

class ChecklistWidget: NSObject, TripWidget {
    var trip: Trip!
    var flight: FlightInfo!
    weak var dashboard: Dashboard!
    let canBeHidden = true
    private(set) dynamic var canBeDisplayed = true
    
//    var items: [TodoItem]
    
    required init(dashboard: Dashboard, trip: Trip, flight: FlightInfo) {
        self.dashboard = dashboard
        self.trip = trip
        self.flight = flight

        super.init()
    }
    
    var viewController: UIViewController? {
        //if you want to present the controller in any other way - call presentWidgetController on a Dashboard
//        let checklistController = ChecklistViewController()
//        checklistController.todoItems = items
//        checklistController.modalPresentationStyle = .FormSheet
        return nil
    }
    
    var cellIdentifier: String {
        return "ChecklistWidgetCell"
    }
    
    var cellHeight: CGFloat {
        return 250
    }
    
    var name: String {
        return "Checklist"
    }
    
    static var widgetType: String {
        return "checklist"
    }
    
    func configureCell(reusableCell: UICollectionViewCell) {
        let cell = reusableCell as! ChecklistWidgetCell
        
//        let uncheckedCount = items.reduce(0, combine: { $0 + ($1.checked ? 0 : 1) })
//        
//        if uncheckedCount > 0 {
//            cell.labelContent.text = String(format: NSLocalizedString("%d items left", comment: "checklist widget items left"), uncheckedCount)
//        } else {
//            cell.labelContent.text = NSLocalizedString("All done. Happy flying!", comment: "checklist widget items left")
//        }
    }
    
    //MARK: Widget Methods
    
}
