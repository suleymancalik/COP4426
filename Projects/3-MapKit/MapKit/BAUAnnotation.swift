//
//  BAUAnnotation.swift
//  MapKit
//
//  Created by Suleyman Calik on 01/04/15.
//  Copyright (c) 2015 BAU. All rights reserved.
//

import UIKit
import MapKit

class BAUAnnotation: NSObject, MKAnnotation {
   
    var coordinate: CLLocationCoordinate2D
    var title:String!
    var subtitle:String!
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
