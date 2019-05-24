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
    
    
    func configure(day: Int, iconName: String, max: Double, min: Double, timezone: String) {
        
        let date = NSDate(timeIntervalSince1970: TimeInterval(day))
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EEEE")
        
        Icon.image = UIImage(named: "\(iconName).png")
        Day.text = String(formatter.string(from: date as Date))
        MaxTemperature.text = String(max)
        MinTemperature.text = String(min)
        
        
    }
    
}
