//
//  ViewController.swift
//  YogaClub
//
//  Created by Лилия Левина on 15.05.17.
//  Copyright © 2017 Лилия Левина. All rights reserved.
//

import UIKit

class OldViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var arrPageDate:NSArray = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.navigationController?.navigationBar.isHidden = true
        self.setViewControllers([viewControllerAtIndex(0)] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- UIPageViewControllerDataSource Methods
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let pageContent: PageViewController = viewController as! PageViewController
        var index = pageContent.pageIndex
        
        if ((index == 0) || (index == NSNotFound))
        {
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let pageContent: PageViewController = viewController as! PageViewController
        var index = pageContent.pageIndex
        
        if (index == NSNotFound)
        {
            return nil;
        }
        index = index + 1;
        if (index == 1)
        {
            return nil;
        }
        return self.viewControllerAtIndex(index)
    }
    
    // MARK:- Other Methods
    func viewControllerAtIndex(_ index: NSInteger) -> PageViewController{
        var pageVC = PageViewController()
        // get the current date and time
        let currentDateTime = Date()
        
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
    
        //formatter.timeStyle = .medium
        formatter.dateStyle = .long
        // get the date time String from the date object
        let strCurrentDateTime = formatter.string(from: currentDateTime)
        
        pageVC.label.text = strCurrentDateTime + "\n" + currentDateTime.dayOfWeek()!
        pageVC.pageIndex = index
        pageVC.currentDateTime = currentDateTime
        return pageVC
    }
}

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
        // or use capitalized(with: locale) if you want
    }
}

