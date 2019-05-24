//
//  DetailViewController.swift
//  WeatherToday
//
//  Created by Yassine FATIHI on 24/05/2019.
//  Copyright © 2019 Yassine FATIHI. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet var detailView: UIView!
    var AnnotationObj: MKPointAnnotation?
    var infoWeather: Weather?
    var toto: String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        TableView.dataSource = self
        RequestManager.getWeatherInfo(latitude: AnnotationObj?.coordinate.latitude ?? 0,
                                      longitude: AnnotationObj?.coordinate.longitude ?? 0,
                                      success: { (data) in
                                        let decoder = JSONDecoder()
                                        self.infoWeather = (try? decoder.decode(Weather.self, from: data))
                              
        }) { (error) in
            print(error)
        }
        
        TableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell_ID")
        TableView.register(UINib(nibName: "ForecastTableViewCell", bundle: nil), forCellReuseIdentifier: "ForecastTableViewCell_ID")
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            if (infoWeather?.hourly.data.count ?? 0 > 10) {
                return 10
            } else {
                return infoWeather?.hourly.data.count ?? 0
            }
        case 2:
            return infoWeather?.daily.data.count ?? 0
        case 3:
            return 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        
        
        
        
        if let cell = TableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell_ID", for: indexPath) as? HeaderTableViewCell {
            cell.configure(iconName: infoWeather?.currently.icon ?? "",
                           temperatures: infoWeather?.currently.temperature ?? 0,
                           currentForecast: infoWeather?.currently.summary ?? "")
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = TableView.dequeueReusableCell(withIdentifier: "ForecastTableViewCell_ID", for: indexPath) as? ForecastTableViewCell {
            cell.configure(summary: infoWeather?.hourly.summary ?? "")
            return cell
        }
        return UITableViewCell()
    }
    
    
}
