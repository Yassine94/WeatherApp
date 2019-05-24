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
                                        self.TableView.reloadData()
                                        
        }) { (error) in
            print(error)
        }
        
        TableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell_ID")
        TableView.register(UINib(nibName: "ForecastTableViewCell", bundle: nil), forCellReuseIdentifier: "ForecastTableViewCell_ID")
        TableView.register(UINib(nibName: "HourlyInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "HourlyInfoTableViewCell_ID")
        TableView.register(UINib(nibName: "DailyInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "DailyInfoTableViewCell_ID")
        TableView.register(UINib(nibName: "ExtraInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "ExtraInfoTableViewCell_ID")
        
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
        
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
            return 2
        case 4:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            
        case 0:
            if let HeaderCell = TableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell_ID", for: indexPath) as? HeaderTableViewCell {
                HeaderCell.configure(iconName: infoWeather?.currently.icon ?? "",
                                     temperatures: infoWeather?.currently.temperature ?? 0,
                                     currentForecast: infoWeather?.currently.summary ?? "")
                return HeaderCell
            }
            
        case 1:
            
            if indexPath.row == 0 {
                if let ForecastCell = TableView.dequeueReusableCell(withIdentifier: "ForecastTableViewCell_ID", for: indexPath) as? ForecastTableViewCell {
                    ForecastCell.configure(summary: infoWeather?.hourly.summary ?? "")
                    return ForecastCell
                } }
                
            else {
                
                if let HourlyCell = TableView.dequeueReusableCell(withIdentifier: "HourlyInfoTableViewCell_ID", for: indexPath) as? HourlyInfoTableViewCell {
                    
                    HourlyCell.configure(hour: infoWeather?.hourly.data[indexPath.row].time ??  0,
                                         iconName: infoWeather?.hourly.data[indexPath.row].icon ?? "",
                                         humidity: infoWeather?.hourly.data[indexPath.row].humidity ??  0,
                                         temperature: infoWeather?.hourly.data[indexPath.row].temperature ??  0,
                                         timezone: infoWeather?.timezone ?? "")
                    return HourlyCell
                }
                
            }
            
            
        case 2:
            if indexPath.row == 0 {
                if let ForecastCell = TableView.dequeueReusableCell(withIdentifier: "ForecastTableViewCell_ID", for: indexPath) as? ForecastTableViewCell {
                    ForecastCell.configure(summary: infoWeather?.daily.summary ?? "")
                    return ForecastCell
                } }
            else {
                if let DailyCell = TableView.dequeueReusableCell(withIdentifier: "DailyInfoTableViewCell_ID", for: indexPath) as? DailyInfoTableViewCell {
                    DailyCell.configure(day: infoWeather?.daily.data[indexPath.row].time ?? 0,
                                        iconName: infoWeather?.daily.data[indexPath.row].icon ?? "",
                                        max: infoWeather?.daily.data[indexPath.row].temperatureMax ?? 0,
                                        min: infoWeather?.daily.data[indexPath.row].temperatureMin ?? 0,
                                        timezone: infoWeather?.timezone ?? "")
                    
                    return DailyCell
                }
            }
            
            
        case 3:
            if indexPath.row == 0 {
                if let ForecastCell = TableView.dequeueReusableCell(withIdentifier: "ForecastTableViewCell_ID", for: indexPath) as? ForecastTableViewCell {
                    ForecastCell.configure(summary:   "Extra informations")
                    return ForecastCell
                } }
            else {
                
                if let ExtraInfoCell = TableView.dequeueReusableCell(withIdentifier: "ExtraInfoTableViewCell_ID", for: indexPath) as? ExtraInfoTableViewCell {
                    ExtraInfoCell.configure(leftTitle: "Humidity", leftLabel: "\(infoWeather?.currently.humidity ?? 0)", rightTitle: "Wind Speed", rightLabel: "\(infoWeather?.currently.windSpeed ?? 0)")
                    return ExtraInfoCell
                }
                
                if let ExtraInfoCell2 = TableView.dequeueReusableCell(withIdentifier: "ExtraInfoTableViewCell_ID", for: indexPath) as? ExtraInfoTableViewCell {
                    ExtraInfoCell2.configure(leftTitle: "Pressure", leftLabel: "\(infoWeather?.currently.pressure ?? 0)", rightTitle: "UV Index", rightLabel: "\(infoWeather?.currently.uvIndex ?? 0)")
                    return ExtraInfoCell2
                    
                }
                
            }
        case 4 :
                if let ExtraInfoCell2 = TableView.dequeueReusableCell(withIdentifier: "ExtraInfoTableViewCell_ID", for: indexPath) as? ExtraInfoTableViewCell {
                    ExtraInfoCell2.configure(leftTitle: "Pressure", leftLabel: "\(infoWeather?.currently.pressure ?? 0)", rightTitle: "UV Index", rightLabel: "\(infoWeather?.currently.uvIndex ?? 0)")
                    return ExtraInfoCell2
                    
                }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
        
    }
}
