//
//  RequestManager.swift
//  WeatherToday
//
//  Created by Yassine FATIHI on 24/05/2019.
//  Copyright © 2019 Yassine FATIHI. All rights reserved.
//

import Foundation
import Alamofire

let key = "0157a01c32e342db42419264e1e375ed"

struct RequestManager {
    
    static func getWeatherInfo(latitude: Double,longitude: Double,success: @escaping (Data)->(), failure: @escaping (Error)->()) {
        Alamofire.request("https://api.darksky.net/forecast/\(key)/\(latitude),\(longitude)?units=si").responseData {
            (data) in
            switch data.result {
            case .success(let value):
                success(value)
                break
            case .failure(let error):
                failure(error)
                break
            }
        }
    }
}
