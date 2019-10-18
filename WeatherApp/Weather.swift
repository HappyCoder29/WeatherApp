//
//  Weather.swift
//  WeatherApp
//
//  Created by Ashish on 10/17/19.
//  Copyright © 2019 Ashish. All rights reserved.
//

import Foundation
import RealmSwift

class Weather: Object{
    @objc dynamic var cityID: String = ""
    @objc dynamic var weatherIcon: String? = ""
    @objc dynamic var cityname: String?
    @objc dynamic var low: Float = 0.00
    @objc dynamic var high: Float = 0.00
    
    
    override static func primaryKey() -> String? {
      return "cityID"
    }
}
