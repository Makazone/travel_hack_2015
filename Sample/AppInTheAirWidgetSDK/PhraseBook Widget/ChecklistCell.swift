//
//  ChecklistCell.swift
//  AppInTheAirWidgetSDK
//
//  Created by Sergey Pronin on 10/23/15.
//  Copyright © 2015 App in the Air. All rights reserved.
//

import UIKit

class ChecklistCell: UITableViewCell {

    @IBOutlet weak var imageCheck: UIImageView!
    @IBOutlet weak var labelItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .None
        backgroundColor = UIColor.aita_backgroundColor()
    }
    
}
