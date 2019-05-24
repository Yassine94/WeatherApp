//
//  ForecastTableViewCell.swift
//  WeatherToday
//
//  Created by Yassine FATIHI on 24/05/2019.
//  Copyright © 2019 Yassine FATIHI. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var ForecastLabel: UILabel!
    
    func configure(summary: String) {
        
        ForecastLabel.text = String(summary)
     
}
}
