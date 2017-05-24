//
//  SettingsTableViewCell1.swift
//  YogaClub
//
//  Created by Лилия Левина on 23.05.17.
//  Copyright © 2017 Лилия Левина. All rights reserved.
//

import Foundation

import UIKit

class SettingsTableViewCell1: UITableViewCell {
    
    let mySwitch:UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        mySwitch.isOn = true
        return mySwitch
    
    }()
    
    var settingName: UILabel = {
        let videoName = UILabel()
        videoName.translatesAutoresizingMaskIntoConstraints = false
        videoName.numberOfLines = 4
        videoName.textAlignment = NSTextAlignment.center
       
        return videoName
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(settingName)
        contentView.addSubview(mySwitch)
        
        NSLayoutConstraint.activate([
            settingName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            settingName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            settingName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100),
            settingName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            //settingName.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0,5),
            
            mySwitch.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mySwitch.leadingAnchor.constraint(equalTo: settingName.trailingAnchor, constant: 5),
            //mySwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            //mySwitch.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
            
            
            //videoName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



