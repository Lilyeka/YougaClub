//
//  CustomTableViewCell3.swift
//  YogaClub
//
//  Created by Лилия Левина on 21.05.17.
//  Copyright © 2017 Лилия Левина. All rights reserved.
//

import Foundation

import UIKit

class CustomTableViewCell3: UITableViewCell {
    
    let imgVideo:UIImageView = {
        let imgVideo = UIImageView()//(frame: CGRect(x: 0, y: 0, width: 250, height: 150))
        imgVideo.backgroundColor = .blue
        imgVideo.translatesAutoresizingMaskIntoConstraints = false
        return imgVideo
    }()
    
    let imgPlay:UIImageView = {
        let imgPlay = UIImageView()//(frame: CGRect(x: 0, y: 0, width: 250, height: 150))
       
        imgPlay.translatesAutoresizingMaskIntoConstraints = false
        imgPlay.image = #imageLiteral(resourceName: "imagePlay")
        return imgPlay
    }()
    
    let videoName: UILabel = {
        let videoName = UILabel()
        videoName.translatesAutoresizingMaskIntoConstraints = false
        videoName.numberOfLines = 4
        videoName.textAlignment = NSTextAlignment.center
        return videoName
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        contentView.addSubview(imgVideo)
        contentView.addSubview(imgPlay)
        contentView.addSubview(videoName)
      //  contentView.addSubview(videoName)
        
        NSLayoutConstraint.activate([
            imgVideo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            imgVideo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            imgVideo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imgVideo.heightAnchor.constraint(equalToConstant: 200),
            imgVideo.widthAnchor.constraint(equalToConstant: 250),
            imgVideo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
            
            imgPlay.leadingAnchor.constraint(equalTo: imgVideo.leadingAnchor, constant: 100),
            imgPlay.trailingAnchor.constraint(equalTo: imgVideo.trailingAnchor, constant: -100),
            imgPlay.topAnchor.constraint(equalTo: imgVideo.topAnchor, constant: 60),
            imgPlay.heightAnchor.constraint(equalToConstant: 60),
            imgPlay.widthAnchor.constraint(equalToConstant: 80),
            imgPlay.bottomAnchor.constraint(equalTo: imgVideo.bottomAnchor, constant: -60),
            
            videoName.topAnchor.constraint(equalTo: imgVideo.bottomAnchor, constant: 0),
            videoName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            videoName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            //videoName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
        ])

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


