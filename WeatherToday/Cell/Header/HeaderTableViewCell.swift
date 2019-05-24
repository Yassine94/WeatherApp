//
//  HeaderTableViewCell.swift
//  WeatherToday
//
//  Created by Yassine FATIHI on 24/05/2019.
//  Copyright © 2019 Yassine FATIHI. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var curentForecast: UILabel!
    
    func configure(iconName: String, temperatures: Double, currentForecast: String) {
        icon.image = UIImage(named: "\(iconName).png")
        temperature.text = String(temperatures)
        curentForecast.text = currentForecast
    }
    
}
