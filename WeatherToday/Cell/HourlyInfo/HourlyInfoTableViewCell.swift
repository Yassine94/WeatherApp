//
//  HourlyInfoTableViewCell.swift
//  WeatherToday
//
//  Created by Yassine FATIHI on 24/05/2019.
//  Copyright © 2019 Yassine FATIHI. All rights reserved.
//

import UIKit

class HourlyInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var HourLabel: UILabel!
    @IBOutlet weak var IconLabel: UIImageView!
    @IBOutlet weak var HumidityLabel: UILabel!
    @IBOutlet weak var TempertureLabel: UILabel!
    
    
    func configure(hour: Int, iconName: String, humidity: Double, temperature: Double) {
        
        IconLabel.image = UIImage(named: "\(iconName).png")
        HourLabel.text = String(hour)
        HumidityLabel.text = String(humidity)
        TempertureLabel.text = String(temperature)
        
        
    }
    
}
