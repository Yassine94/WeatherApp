//
//  DailyInfoTableViewCell.swift
//  WeatherToday
//
//  Created by Yassine FATIHI on 24/05/2019.
//  Copyright © 2019 Yassine FATIHI. All rights reserved.
//

import UIKit

class DailyInfoTableViewCell: UITableViewCell {


    @IBOutlet weak var Day: UILabel!
    @IBOutlet weak var Icon: UIImageView!
    @IBOutlet weak var MaxTemperature: UILabel!
    @IBOutlet weak var MinTemperature: UILabel!
    
    
    func configure(day: Int, iconName: String, max: Double, min: Double) {
        
        Icon.image = UIImage(named: "\(iconName).png")
        Day.text = String(day)
        MaxTemperature.text = String(max)
        MinTemperature.text = String(min)
        
        
    }
    
}
