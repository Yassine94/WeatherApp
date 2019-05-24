//
//  ExtraInfoTableViewCell.swift
//  WeatherToday
//
//  Created by Yassine FATIHI on 24/05/2019.
//  Copyright © 2019 Yassine FATIHI. All rights reserved.
//

import UIKit

class ExtraInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var Humidity: UILabel!
    @IBOutlet weak var Windspeed: UILabel!
    @IBOutlet weak var Pressure: UILabel!
    @IBOutlet weak var UVindex: UILabel!
    
    func configure(humidity: Double, windspeed: Double, pressure: Double, uvindex: Int) {
        
        Humidity.text = "Humidity"
        Windspeed.text = "Windspeed"
        Pressure.text = "Pressure"
        UVindex.text = "UV Index"
        
        
    }
    
}
