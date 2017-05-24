//
//  ViewController.swift
//  YogaClub
//
//  Created by Лилия Левина on 23.05.17.
//  Copyright © 2017 Лилия Левина. All rights reserved.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
    }
    
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
        let imgHome: UIImage = {
            var img = UIImage()
            img = #imageLiteral(resourceName: "imageHomePage")
            return img
        }()
        // Create Tab one
        let tabOne = PageViewController()
        let tabOneBarItem = UITabBarItem(title: "Главная", image: imageWithImage(image: imgHome, scaledToSize:CGSize(width: 25.0, height: 25.0)), selectedImage:imageWithImage(image: imgHome, scaledToSize:CGSize(width: 25.0, height: 25.0)))
        
        tabOne.tabBarItem = tabOneBarItem
        
        // Create Tab two
        let tabTwo = TabTwoViewController()
        let tabTwoBarItem2 = UITabBarItem(title: "Стр 2", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        tabTwo.tabBarItem = tabTwoBarItem2
        
        // Create Tab three
        let tabThree = TabThreeViewController()
        let tabThreeBarItem3 = UITabBarItem(title: "Стр 3", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        tabThree.tabBarItem  = tabThreeBarItem3
        
        // Create Tab Four
        let tabFour = UserSettingsViewController()
        let tabFourBarItem4 = UITabBarItem(title: "Настройки", image:#imageLiteral(resourceName: "ImageSettings"), selectedImage:#imageLiteral(resourceName: "ImageSettings"))
        tabFour.tabBarItem  = tabFourBarItem4
        
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
