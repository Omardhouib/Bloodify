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
    var location: String
    var image: String
    var phone: String
    var description: String
    var isVisited: Bool
    
    init(name: String, type: String, location: String, image: String, phone: String, description: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.phone = phone
        self.description = description
        self.isVisited = isVisited
    }
    
    convenience init() {
        self.init(name: "", type: "", location: "", image: "", phone: "", description: "", isVisited: false)
    }
}
