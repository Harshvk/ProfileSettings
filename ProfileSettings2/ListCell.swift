//
//  HeadingCell.swift
//  ProfileSettings2
//
//  Created by appinventiv on 08/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class ListCell : UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var infoText: UITextField!
    
    func configureCell(_ data: [String:String])
    {
        titleLabel.text = data["Title"]
        infoText.text = data["Info"]
        
    }
    
    
}
