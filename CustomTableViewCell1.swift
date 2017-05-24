//
//  CustomTableViewCell1.swift
//  YogaClub
//
//  Created by Лилия Левина on 21.05.17.
//  Copyright © 2017 Лилия Левина. All rights reserved.
//

import Foundation

import UIKit

class CustomTableViewCell1: UITableViewCell {
    
    let eventName: UILabel = {
        let eventName = UILabel()
        eventName.translatesAutoresizingMaskIntoConstraints = false
        eventName.numberOfLines = 4
        eventName.shadowColor = .gray
        eventName.font = UIFont.systemFont(ofSize: 14)
        eventName.textAlignment = NSTextAlignment.left
        return eventName
    }()
    let eventLocation: UILabel = {
        let eventLocation = UILabel()
        eventLocation.translatesAutoresizingMaskIntoConstraints = false
        eventLocation.textAlignment = NSTextAlignment.right
        return eventLocation
    }()
    let eventDate: UILabel = {
        let eventDate = UILabel()
        eventDate.translatesAutoresizingMaskIntoConstraints = false
        eventDate.textAlignment = NSTextAlignment.left
        return eventDate
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(eventName)
        contentView.addSubview(eventLocation)
        contentView.addSubview(eventDate)
        
        NSLayoutConstraint.activate([
            eventDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            eventDate.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            eventDate.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            
            eventLocation.leadingAnchor.constraint(equalTo: eventDate.trailingAnchor, constant: 0),
            eventLocation.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            eventLocation.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            eventLocation.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            
            eventName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            eventName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:-10),
            eventName.topAnchor.constraint(equalTo: eventDate.bottomAnchor, constant: 5),
            eventName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

