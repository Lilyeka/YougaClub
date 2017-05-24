//
//  Event.swift
//  YogaClub
//
//  Created by Лилия Левина on 22.05.17.
//  Copyright © 2017 Лилия Левина. All rights reserved.
//

import Foundation

class Event {
    
    var name:String
    var url: String
    var date:String
    var location: String
    
    required init(name: String, url: String, date: String, location: String){
        self.name = name
        self.url = url
        self.date = date
        self.location = location
    }
}

class Article {
    var name:String
    var url: String
    var date:String
    var text: String
    
    required init(name: String, url: String, date: String, text: String){
        self.name = name
        self.url = url
        self.date = date
        self.text = text
    }
}

class Video {
    var name:String
    var id:String
    
    required init(name: String,id: String){
        self.name = name
        self.id = id
    }
}

