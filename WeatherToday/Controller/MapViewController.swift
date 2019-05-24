//
//  MapViewController.swift
//  WeatherToday
//
//  Created by Yassine FATIHI on 24/05/2019.
//  Copyright © 2019 Yassine FATIHI. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in CitiesData.list {
            let pin = MKPointAnnotation()
            pin.coordinate = item.coordinates
            mapView.addAnnotation(pin)
            
        }
        
     
    }
    
    func mapView(_mapView: MKMapView, didSelet view:MKAnnotationView){
        if let annotation = view.annotation as? MKPointAnnotation {
            performSegue(withIdentifier: "MapID", sender: annotation)
            
        }
    }
    

  
}
