//
//  ExtraInfoTableViewCell.swift
//  WeatherToday
//
//  Created by Yassine FATIHI on 24/05/2019.
//  Copyright © 2019 Yassine FATIHI. All rights reserved.
//

import UIKit

class ExtraInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var leftTitle: UILabel!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightTitle: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    func configure(leftTitle: String, leftLabel: String, rightTitle: String, rightLabel: String) {
        
        self.leftTitle.text = leftTitle
        self.leftLabel.text = leftLabel
        self.rightTitle.text = rightTitle
        self.rightLabel.text = rightLabel
        
        
    }
    
}
