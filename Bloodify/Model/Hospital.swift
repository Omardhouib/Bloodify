//
//  Hospital.swift
//  Bloodify
//
//  Created by Omar Dhouib on 2/18/19.
//  Copyright © 2019 Omar Dhouib. All rights reserved.
//

import Foundation

struct Hospital {
    var name: String?
    var long: Double?
    var lat:  Double?
    
    init(name: String?,long: Double?,lat: Double?) {
        self.name = name
        self.long = long
        self.lat  = lat
    }
}
