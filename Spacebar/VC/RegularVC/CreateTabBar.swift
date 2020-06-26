//
//  CreateTabBar.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/26/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit

class CreateTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    func createHomeNC() -> UINavigationController {
    
        let homeVC = HomeVC()
        
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
    
        return UINavigationController(rootViewController: homeVC)
        
    }
    
    func createShortNC() -> UINavigationController {
        
        let shortVC = ShortVC()
        
        shortVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        return UINavigationController(rootViewController: shortVC)
        
    }
    
    func createVideosNC() -> UINavigationController {
        
        let videosVC = VideosVC()
        
        videosVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        
        return UINavigationController(rootViewController: videosVC)
        
    }
    
    func createNotiNC() -> UINavigationController {
        
        let notiVC = NotiVC()
        
        notiVC.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 3)
        
        return UINavigationController(rootViewController: notiVC)
    }
    
    func createProfileNC() -> UINavigationController {
        
        let profileVC = ProfileVC()
        
        profileVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 4)
        
        return UINavigationController(rootViewController: profileVC)
        
    }
    
    func configure() {
        
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.07450980392, green: 0.1137254902, blue: 0.2784313725, alpha: 1)
        UITabBar.appearance().tintColor = .yellow
        
        setViewControllers([createHomeNC(), createShortNC(), createVideosNC(), createNotiNC(), createProfileNC()], animated: true)
    }

}
