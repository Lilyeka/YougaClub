//
//  CustomTableViewCell2.swift
//  YogaClub
//
//  Created by Лилия Левина on 21.05.17.
//  Copyright © 2017 Лилия Левина. All rights reserved.
//

import Foundation

import UIKit

class CustomTableViewCell2: UITableViewCell {
    
    let articleName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.numberOfLines = 2
        //name.shadowColor = .gray
        name.font = UIFont.boldSystemFont(ofSize: 16)
        name.textAlignment = NSTextAlignment.left
        return name
    }()
    let articleText: UILabel = {
        let articleText = UILabel()
        articleText.translatesAutoresizingMaskIntoConstraints = false
        articleText.font = UIFont.systemFont(ofSize: 14)
        articleText.numberOfLines = 20
        articleText.textAlignment = NSTextAlignment.left
        return articleText
    }()
    let articleDate: UILabel = {
        let articleDate = UILabel()
        articleDate.translatesAutoresizingMaskIntoConstraints = false
        articleDate.textAlignment = NSTextAlignment.right
        articleDate.font = UIFont.systemFont(ofSize: 14)
        return articleDate
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(articleName)
        contentView.addSubview(articleText)
        contentView.addSubview(articleDate)
        
        NSLayoutConstraint.activate([
            articleName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            articleName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            articleName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            
            articleText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            articleText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            articleText.topAnchor.constraint(equalTo: articleName.bottomAnchor, constant: 5),
            
            articleDate.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -200),
            articleDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:-5),
            articleDate.topAnchor.constraint(equalTo: articleText.bottomAnchor, constant: 0),
            articleDate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


