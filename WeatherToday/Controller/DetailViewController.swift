//
//  DetailViewController.swift
//  WeatherToday
//
//  Created by Yassine FATIHI on 24/05/2019.
//  Copyright © 2019 Yassine FATIHI. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    var AnnotationObj: MKPointAnnotation?
    var infoWeather: Weather?
    
    @IBOutlet var detailView: UIView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
     RequestManager.getWeatherInfo(latitude: AnnotationObj?.coordinate.latitude ?? 0,
                                   longitude: AnnotationObj?.coordinate.longitude ?? 0,
                                   success: { (data) in
                                    let decoder = JSONDecoder()
                                    infoWeather = (try? decoder.decode(Weather.self, from: <#T##Data#>))
                                    
     }, failure: <#T##(Error) -> ()#>)
       
    }
    
    
   

}
