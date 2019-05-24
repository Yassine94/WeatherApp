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
    
    
    func configure(hour: Int, iconName: String, humidity: Double, temperature: Double, timezone: String) {
        
        
        let date = NSDate(timeIntervalSince1970: TimeInterval(hour))
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: timezone)
        formatter.setLocalizedDateFormatFromTemplate("HH")
        
        IconLabel.image = UIImage(named: "\(iconName).png")
        HourLabel.text = String(formatter.string(from: date as Date))
        HumidityLabel.text = "\(Int(humidity*100)) %"
        TempertureLabel.text = String(temperature)
        
        
    }
    
}
