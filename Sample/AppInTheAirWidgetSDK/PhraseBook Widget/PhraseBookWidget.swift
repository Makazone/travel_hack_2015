//
//  PhraseBookWidget.swift
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
        return "PhraseBookWidgetCell"
    }
    
    var cellHeight: CGFloat {
        return 200
    }
    
    var name: String {
        return "PhraseBook"
    }
    
    static var widgetType: String {
        return "phrasebook"
    }
    
    func configureCell(reusableCell: UICollectionViewCell) {
        let cell = reusableCell as! ChecklistWidgetCell
        
        cell.countryCode = self.flight.airportDestination.country
        cell.loadCards()
    }
    
    //MARK: Widget Methods
    
}
