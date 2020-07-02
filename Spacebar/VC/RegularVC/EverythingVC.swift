//
//  EverythingVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/28/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit

class EverythingVC: UIViewController {
    
    var sideMenuVC: UIViewController!
    var sideMenuVCNC: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBar()
            
    }
    
    func configureTabBar(){
        
        let tabBarVC = CreateTabBar()
        
        view.addSubview(tabBarVC.view)
        
        configureSideMenu()
        
    }
    
    func configureSideMenu() {

        if sideMenuVC == nil {

            sideMenuVC = SideMenuVC()
            
            sideMenuVCNC = UINavigationController(rootViewController: sideMenuVC)
            
            addChild(sideMenuVCNC)
            sideMenuVCNC.view.frame = self.view.bounds
            view.insertSubview(sideMenuVCNC.view, at: 0)
            sideMenuVCNC.didMove(toParent: self)

        }

    }
       
}
