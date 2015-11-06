//
//  ViewController.swift
//  Honolulu
//
//  Created by Ricardo Gonzalez on 11/5/15.
//  Copyright © 2015 PiñataSoftware. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let initialLocation = CLLocation(latitude: 28.6411, longitude: -106.0723)
        centerMapOnLocation(initialLocation)
        //28.649507 ,  -106.07141017
        let annotation = MapPin(title: "Canal y Colón", coordinate: CLLocationCoordinate2D(latitude: 28.649507, longitude: -106.07141017))
        mapView.addAnnotation(annotation)
    }
    
    let regionRadius : CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

