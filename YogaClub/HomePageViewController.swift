//
//  PageViewController.swift
//  YogaClub
//
//  Created by Лилия Левина on 15.05.17.
//  Copyright © 2017 Лилия Левина. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {
    var pageIndex: Int = 0
    var currentDateTime = Date()
   
    var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.numberOfLines = 2
        label.text = "TEXT!!!"
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var logoImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "logo")
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
        //self.navigationController?.navigationBar.isHidden = true
        currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        let strCurrentDateTime = formatter.string(from: currentDateTime)
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        
        label.text = strCurrentDateTime + "\n" + currentDateTime.dayOfWeek()!
        
        view.backgroundColor = .white
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: barHeight + 5),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        view.addSubview(logoImage)
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100)
            ])
        
        view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            containerView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant:0),
            containerView.bottomAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 100)
            ])
        
        view.addSubview(containerView1)
        NSLayoutConstraint.activate([
            containerView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            containerView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            containerView1.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            containerView1.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant:-39)
            ])
        
        // add child view controller view to container
        let hController = HorisontalScrollingImg()
        hController.dayOfWeek = currentDateTime.dayOfWeek()!
        addChildViewController(hController)
        hController.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(hController.view)
        NSLayoutConstraint.activate([
            hController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            hController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            hController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            hController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
        hController.didMove(toParentViewController: self)
        
        // add child view controller view to container
        let tableViewController = CurrentInfoTableViewController()
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
