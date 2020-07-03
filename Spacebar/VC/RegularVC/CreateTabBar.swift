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
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        configure()
        
    }
    
    func createHomeNC() -> UINavigationController {
    
        let homeVC = HomeVC()
        
        homeVC.delegate = self
        
        homeVC.tabBarItem.image = UIImage(systemName: "text.bubble")
        homeVC.tabBarItem.selectedImage = UIImage(systemName: "text.bubble.fill")
            
        homeVC.extendedLayoutIncludesOpaqueBars = true
    
        return UINavigationController(rootViewController: homeVC)
        
    }
    
    func createShortNC() -> UINavigationController {
        
        let shortVC = ShortVC()
        
        shortVC.delegate = self
            
        shortVC.tabBarItem.image = UIImage(systemName: "film")
        shortVC.tabBarItem.selectedImage = UIImage(systemName: "film.fill")
        
        shortVC.extendedLayoutIncludesOpaqueBars = true
        
        return UINavigationController(rootViewController: shortVC)
        
    }
    
    func createVideosNC() -> UINavigationController {
        
        let videosVC = VideosVC()
        
        videosVC.delegate = self
        
        videosVC.tabBarItem.image = UIImage(systemName: "play.rectangle")
        videosVC.tabBarItem.selectedImage = UIImage(systemName: "play.rectangle.fill")
        
        videosVC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: 0, right: 0)
        
        videosVC.extendedLayoutIncludesOpaqueBars = true
        
        return UINavigationController(rootViewController: videosVC)
        
    }
    
    func createNotiNC() -> UINavigationController {
        
        let notiVC = NotiVC()
        
        notiVC.delegate = self
            
        notiVC.tabBarItem.image = UIImage(systemName: "bell")
        notiVC.tabBarItem.selectedImage = UIImage(systemName: "bell.fill")
            
        notiVC.extendedLayoutIncludesOpaqueBars = true
        notiVC.edgesForExtendedLayout = .all
        
        return UINavigationController(rootViewController: notiVC)
    }
    
    func createProfileNC() -> UINavigationController {
        
        let profileVC = ProfileVC()
        
        profileVC.delegate = self
            
        profileVC.tabBarItem.image = UIImage(systemName: "person")
        profileVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
    
        profileVC.extendedLayoutIncludesOpaqueBars = true
        
        return UINavigationController(rootViewController: profileVC)
        
    }
    
    func configure() {
        
        tabBar.unselectedItemTintColor = .black
        tabBar.isTranslucent = true
        tabBar.tintColor = .black
        tabBar.barTintColor = #colorLiteral(red: 0.9198423028, green: 0.9198423028, blue: 0.9198423028, alpha: 1)
        tabBar.clipsToBounds = true
        
        
        setViewControllers([createHomeNC(), createShortNC(), createVideosNC(), createNotiNC(), createProfileNC()], animated: true)

        //configureSideMenu()
        
    }
    
    func configureSideMenu() {
        
        if sideMenuVC == nil {
            
            sideMenuVC = SideMenuVC()
            
            view.insertSubview(sideMenuVC.view, at: 0)
            addChild(sideMenuVC)
            sideMenuVC.didMove(toParent: self)
            
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
            
            //configureSideMenu()
            
        }

        isExpanded = !isExpanded
        showSideMenu(shouldExpand: isExpanded)

        
    }
    
}
