//
//  Foods.swift
//  YogaClub
//
//  Created by Лилия Левина on 17.05.17.
//  Copyright © 2017 Лилия Левина. All rights reserved.
//

import Foundation

class Food {
    
    var name: String
    var dimention: String
    var dayOfWeek: String
    var url: String
    
    required init(name: String, dimention: String, dayOfWeek: String, url: String) {
        self.name = name
        self.dimention = dimention
        self.dayOfWeek = dayOfWeek
        self.url = url
    }
}

