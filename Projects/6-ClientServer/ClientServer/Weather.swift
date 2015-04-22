//
//  Weather.swift
//  ClientServer
//
//  Created by Suleyman Calik on 22/04/15.
//  Copyright (c) 2015 BAU. All rights reserved.
//

import UIKit

class Weather: NSObject {
   
    var temprature:Double
    var weatherDescription:String
    
    init(temprature:Double, description:String) {
        self.temprature = temprature
        self.weatherDescription = description
    }
    
}
