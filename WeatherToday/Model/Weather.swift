//
//  WeatherMesure.swift
//  WeatherToday
//
//  Created by Yassine FATIHI on 23/05/2019.
//  Copyright © 2019 Yassine FATIHI. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    var currently: Currently
    var hourly: Hourly
    var daily : Daily
    var timezone: String
}
struct Currently : Decodable {
    var icon: String
    var temperature: Double
    var summary: String
    var pressure: Double
    var uvIndex: Int
    var windSpeed: Double
    var humidity: Double
}
struct Hourly:Decodable {
    var summary: String
    var data : [Datas]
}
struct Datas:Decodable {
    var time: Int
    var icon: String
    var humidity: Double
    var temperature: Double
}

struct Daily: Decodable {
    var summary: String
    var data: [DataDaily]
}
struct  DataDaily: Decodable {
    var time: Int
    var icon: String
    var temperatureMin: Double
    var temperatureMax: Double
}
