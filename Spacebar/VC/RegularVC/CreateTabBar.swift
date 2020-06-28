//
//  CreateTabBar.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/26/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: To display the initial tab bar seen on screen

import UIKit

class CreateTabBar: UITabBarController {
    
    var sideMenuVC: UIViewController!
    var isExpanded = false

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        
    }
    
    func createHomeNC() -> UINavigationController {
    
        let homeVC = HomeVC()
        
        homeVC.delegate = self
        
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
    
        return UINavigationController(rootViewController: homeVC)
        
    }
    
    func createShortNC() -> UINavigationController {
        
        let shortVC = ShortVC()
        
        shortVC.delegate = self
        
        shortVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        return UINavigationController(rootViewController: shortVC)
        
    }
    
    func createVideosNC() -> UINavigationController {
        
        let videosVC = VideosVC()
        
        videosVC.delegate = self
        
        videosVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        
        return UINavigationController(rootViewController: videosVC)
        
    }
    
    func createNotiNC() -> UINavigationController {
        
        let notiVC = NotiVC()
        
        notiVC.delegate = self
        
        notiVC.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 3)
        
        return UINavigationController(rootViewController: notiVC)
    }
    
    func createProfileNC() -> UINavigationController {
        
        let profileVC = ProfileVC()
        
        profileVC.delegate = self
        
        profileVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 4)
        
        return UINavigationController(rootViewController: profileVC)
        
    }
    
    func configure() {
        
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.07450980392, green: 0.1137254902, blue: 0.2784313725, alpha: 1)
        UITabBar.appearance().tintColor = .yellow
        
        setViewControllers([createHomeNC(), createShortNC(), createVideosNC(), createNotiNC(), createProfileNC()], animated: true)
        
        configureSideMenu()
        
    }
    
    func configureSideMenu(){
        
        if sideMenuVC == nil {
            
            sideMenuVC = SideMenuVC()
            
            print("I'm working!")
            
        }
        
        
    }
    
    func showSideMenu(shouldExpand: Bool){
        
        if shouldExpand {
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                
                self.view.frame.origin.x = self.view.frame.width - 80
                
            }, completion: nil)
            
            
        }
        
        else {
        
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                
                self.view.frame.origin.x = 0
                
            }, completion: nil)
            
        }
        
    }
    

}

extension CreateTabBar: ViewControllerDelegate {
    
    func sideMenuToggle() {
        
        if !isExpanded {
            
            configureSideMenu()
            
        }

        isExpanded = !isExpanded
        showSideMenu(shouldExpand: isExpanded)

        
    }
    
}
