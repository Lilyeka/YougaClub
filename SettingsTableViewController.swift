//
//  SettingsTableViewController.swift
//  YogaClub
//
//  Created by Лилия Левина on 23.05.17.
//  Copyright © 2017 Лилия Левина. All rights reserved.
//

import UIKit


class SettingsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let settings: [String] = [
        "Отображать ближайшие события календаря",
        "Отображать актуальные статьи из блога",
        "Отображать актуальное видео\n                       ",
        "Отображать новости c vk.com\n                        ",
        "Отображать перечнень интернет-ресурсов                "
    ]
    
    private var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Настройки пользователя"
        //let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        //let displayWidth: CGFloat = self.view.frame.width
        //let displayHeight: CGFloat = self.view.frame.height
        
        myTableView = UITableView()
        myTableView.register(SettingsTableViewCell1.self, forCellReuseIdentifier: "cell1")
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.estimatedRowHeight = 44
        
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(myTableView)
        
        NSLayoutConstraint.activate([
            myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            myTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            ])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
    }
 
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! SettingsTableViewCell1
            cell.settingName.text = settings[indexPath.row]
            if indexPath.row > 2 {
                cell.mySwitch.isOn = false
            }
            return cell
        
    }
}
