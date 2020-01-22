//
//  Cafe.swift
//  Bloodify
//
//  Created by Omar Dhouib on 12/18/18.
//  Copyright © 2018 Omar Dhouib. All rights reserved.
//

import Foundation

class Cafe {
    var name: String
    var type: String
    var image: String
    var phone: String
    var description: String
    var isVisited: Bool
    
    var long : Double?
    var lat  : Double?
    
    // it's a tuple
    var locationTuple: (long : Double,lat : Double) = (long: 0,lat: 0)
    
    var access = (200,"success")
    
    init(name: String, type: String, image: String, phone: String, description: String, isVisited: Bool,long: Double?,lat: Double?) {
        self.name = name
        self.type = type
        self.image = image
        self.phone = phone
        self.description = description
        self.isVisited = isVisited
        self.long = long
        self.lat = lat
    }
    
    convenience init() {
        self.init(name: "", type: "", image: "", phone: "", description: "", isVisited: false, long: 0,lat: 0)
    }
}
