//
//  Location.swift
//  lab9_googleMaps
//
//  Created by X Code User on 7/21/15.
//  Copyright (c) 2015 gvsu.edu. All rights reserved.
//

import Foundation

class Location {
    var company: String
    var phone: String
    var latitude: Double
    var longitude: Double
    
    init(company: String, phone: String, latitude: Double, longitude: Double){
        self.company = company
        self.phone = phone
        self.latitude = latitude
        self.longitude = longitude
    }
    
    convenience init(company: String, phone: String, location: String){
        var locationArray = location.componentsSeparatedByString(", ")
        let latitude = (locationArray[0] as NSString).doubleValue
        let longitude = (locationArray[1] as NSString).doubleValue
        self.init(company: company, phone: phone, latitude: latitude, longitude: longitude)
    }
    
    var description: String{
        return "Company: \(company) \n Phone:\(phone) \n (\(latitude),\(longitude))"
    }
}