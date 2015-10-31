//
//  ChecklistViewController.swift
//  AppInTheAirWidgetSDK
//
//  Created by Sergey Pronin on 10/23/15.
//  Copyright © 2015 App in the Air. All rights reserved.
//

import UIKit
import WidgetSDK

class ChecklistViewController: UIViewController {
    
    let tableView = UITableView()
    
    var todoItems = [TodoItem]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = UIColor.aita_backgroundColor()
        self.view.backgroundColor = UIColor.aita_backgroundColor()
        
        tableView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        tableView.frame = self.view.bounds
        
        self.view.addSubview(tableView)
        
        tableView.registerNib(UINib(nibName: "ChecklistCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "ChecklistCell")
        tableView.rowHeight = 50
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}

//MARK: - UITableViewDelegate
extension ChecklistViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = todoItems[indexPath.row]
        item.checked = !item.checked
        
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        CoreDataHelper.instance.save()
    }
}

//MARK: - UITableViewDataSource
extension ChecklistViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistCell") as! ChecklistCell
        
        let item = todoItems[indexPath.row]
        
        cell.labelItem.text = item.text
        cell.imageCheck.image = UIImage(named: item.checked ? "feed_checklist_check" : "feed_checklist_uncheck")
        
        return cell
    }
}

//MARK: - AAPopupViewControllerDelegate
extension ChecklistViewController: AAPopupViewControllerDelegate {
    func popupViewControllerPreferredWidth(controller: AAPopupViewController, forTraitCollection collection: UITraitCollection) -> CGFloat {
        return collection.horizontalSizeClass == .Regular ? 600 : 0
    }
}

