//
//  UserSettingsViewController.swift
//  YogaClub
//
//  Created by Лилия Левина on 18.05.17.
//  Copyright © 2017 Лилия Левина. All rights reserved.
//

import UIKit

class UserSettingsViewController: UIViewController {

        
        var label: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 25)
            label.numberOfLines = 2
            label.text = "TEXT!!!"
            label.textAlignment = .center
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        var logoImage: UIImageView = {
            let img = UIImageView()
            img.image = #imageLiteral(resourceName: "Image")
            img.translatesAutoresizingMaskIntoConstraints = false
            img.contentMode = .scaleAspectFill
            return img
        }()
        
        var containerView:UIView = {
            let contView = UIView()
            contView.backgroundColor = UIColor.red
            contView.translatesAutoresizingMaskIntoConstraints = false
            return contView
        }()
        
        var containerView1:UIView = {
            let contView = UIView()
            contView.backgroundColor = UIColor.blue
            contView.translatesAutoresizingMaskIntoConstraints = false
            return contView
        }()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
         
            
            label.text = "Иван Иванов"
            
            view.backgroundColor = .white
            
       
            view.addSubview(logoImage)
            NSLayoutConstraint.activate([
                logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
                logoImage.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 120),
                logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                 logoImage.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 110),
                logoImage.widthAnchor.constraint(equalToConstant: 100),
                logoImage.heightAnchor.constraint(equalToConstant: 100)
                ])
            
            view.addSubview(label)
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
                label.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 10),
                label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
                //label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                ])
            
            view.addSubview(containerView1)
            NSLayoutConstraint.activate([
                containerView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                containerView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                containerView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
                containerView1.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])
            

            
            // add child view controller view to container
            let tableViewController = SettingsTableViewController()
            addChildViewController(tableViewController)
            tableViewController.view.translatesAutoresizingMaskIntoConstraints = false
            containerView1.addSubview(tableViewController.view)
            NSLayoutConstraint.activate([
                tableViewController.view.leadingAnchor.constraint(equalTo: containerView1.leadingAnchor),
                tableViewController.view.trailingAnchor.constraint(equalTo: containerView1.trailingAnchor),
                tableViewController.view.topAnchor.constraint(equalTo: containerView1.topAnchor),
                tableViewController.view.bottomAnchor.constraint(equalTo: containerView1.bottomAnchor)
                ])
            tableViewController.didMove(toParentViewController: self)
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
}
