//
//  MapPin.swift
//  Honolulu
//
//  Created by Ricardo Gonzalez on 11/5/15.
//  Copyright © 2015 PiñataSoftware. All rights reserved.
//

import MapKit

class MapPin : NSObject, MKAnnotation{
    let title : String?
    let coordinate : CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D){
        self.title = title
        self.coordinate = coordinate
        super.init()
    }
}
