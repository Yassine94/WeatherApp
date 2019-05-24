//
//  DetailViewController.swift
//  WeatherToday
//
//  Created by Yassine FATIHI on 24/05/2019.
//  Copyright © 2019 Yassine FATIHI. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var detailView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
RequestManager.getWeatherInfo(latitude: String, longitude: <#T##String#>, success: <#T##(Data) -> ()#>, failure: <#T##(Error) -> ()#>)
       
    }
    
    
   

}
