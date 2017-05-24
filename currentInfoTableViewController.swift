//
//  currentInfoTableViewController.swift
//  YogaClub
//
//  Created by Лилия Левина on 19.05.17.
//  Copyright © 2017 Лилия Левина. All rights reserved.
//

import UIKit
import SafariServices

class CurrentInfoTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SFSafariViewControllerDelegate {

    private let sections: NSArray = ["События", "Статьи", "Видео дня"]
    private let events: [Event] = [
    Event(name: "Фестиваль «Интегральная женщина»", url: "http://www.olegcherne.ru/meropriyatiye/521-integralnaya-zhenshhina/", date: "23-25 мая", location: "Уфа"),
    Event(name: "Семинар «Орфическое мышление»", url: "http://www.olegcherne.ru/meropriyatiye/540-orficheskoe-mishlenie/", date: "23-27 мая", location: "Уфа"),
    Event(name: "Семинар «Построение алхимического сознания. Учение бессмертного Цао Гоцзю»", url: "http://www.olegcherne.ru/meropriyatiye/519-cao-goju-ufa/", date: "26-28 мая", location: "Уфа")
    ]
    private let articles: [Article] = [
    Article(name: "Ответы на вопросы по образованию", url: "http://www.olegcherne.ru/post-ru/58-obrazovanie/", date: "17 мая 2017", text: "Какова хронология периодов формирования сознания? Какие аспекты сознания формируются в каждый период? Если мы говорим о всеохватывающем, так сказать, исчерпывающем для человека познании, то здесь мы сталкиваемся с тремя уровнями частот."),
    Article(name: "Вопросы женского толка. Дао Херика 10 лет спустя.", url: "http://www.olegcherne.ru/post-ru/381-voprosi-zhenskogo-rzvitiya/", date: "09 мая 2017", text: "Киноварь: Слушай, ЧОМ, я тут одну Эфилу знаю, так она хорошо в волосах разбирается. У нее есть вопросы — можно пригласить. \nЧОМ: А как это — хорошо разбираться в волосах? \nКиноварь: Ну, моет их постоянно, чешет. \nЧОМ: Моет шампунем «Карма»? У тебя что,лирическое настроение?")
    ]
    
    private let videos:[Video] = [
        Video(name: "Нефритовая терапия", id: "nCy9l2lh7Bg"),
        Video(name: "ЧОМ. Даосская алхимия для женщин", id: "h_PQG7sSyLg")
    ]
    
    private var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        //let displayWidth: CGFloat = self.view.frame.width
        //let displayHeight: CGFloat = self.view.frame.height
        
        myTableView = UITableView()//(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(CustomTableViewCell1.self, forCellReuseIdentifier: "cell1")
        myTableView.register(CustomTableViewCell2.self, forCellReuseIdentifier: "cell2")
        myTableView.register(CustomTableViewCell3.self, forCellReuseIdentifier: "cell3")
  
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 18))
        returnedView.backgroundColor = UIColor(colorLiteralRed: 229.0/255, green: 217.0/255, blue: 185.0/255, alpha: 1.0)
        
        let label = UILabel(frame: CGRect(x: 10, y: 7, width: view.frame.size.width, height: 18))
        label.text = self.sections[section] as! String
        label.textColor = .black
        returnedView.addSubview(label)
        
        return returnedView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        if indexPath.section == 0 {
            if let url = URL(string: events[indexPath.row].url){
                let svc = SFSafariViewController(url: url)
                svc.delegate = self
                self.present(svc, animated: true, completion: nil)
            }
        } else if indexPath.section == 1 {
            if let url = URL(string: articles[indexPath.row].url){
             openUrlInSafari(url: url)
            }
        } else if indexPath.section == 2 {
           // print("Value \(meat[indexPath.row])")
            if let url = URL(string: "https://www.youtube.com/watch?v=\(videos[indexPath.row].id)"){
                openUrlInSafari(url: url)
            }
            
        }
    }
    
    func openUrlInSafari(url: URL) {
        let svc = SFSafariViewController(url: url)
        svc.delegate = self
        self.present(svc, animated: true, completion: nil)
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section] as? String
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return events.count
        } else if section == 1 {
            return articles.count
        } else if section == 2 {
            return videos.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CustomTableViewCell1
            cell.eventName.text = events[indexPath.row].name
            cell.eventLocation.text = events[indexPath.row].location
            cell.eventDate.text = events[indexPath.row].date
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! CustomTableViewCell2
            cell.articleName.text = articles[indexPath.row].name
            cell.articleText.text = articles[indexPath.row].text
            cell.articleDate.text = articles[indexPath.row].date
            //DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .short, timeStyle: .short)
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! CustomTableViewCell3
            let imageData = NSData(contentsOf: URL(string:"https://img.youtube.com/vi/\(videos[indexPath.row].id)/default.jpg")!)
            cell.imgVideo.image = UIImage(data: imageData as! Data)
            cell.videoName.text = videos[indexPath.row].name
            return cell
        }
        return UITableViewCell()
    }
}
