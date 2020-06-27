//
//  ProfileVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: To display user profile information

import UIKit

class ProfileVC: UIViewController {
    
    var delegate: ViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.1137254902, blue: 0.2784313725, alpha: 1)
        
        configureNavBar()
        
    }
    
    func configureNavBar(){
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let accountSettingsItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(pushAccountSettingsVC)) 
        
        let sideMenuItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(pushSideMenuVC))
        
        navigationItem.setRightBarButton(accountSettingsItem, animated: true)
        navigationItem.setLeftBarButton(sideMenuItem, animated: true)

    }
    
    @objc func pushSideMenuVC(){
        
       delegate?.sideMenuToggle()
        
    }
    
    @objc func pushAccountSettingsVC(){
        
        let accountSettingsVC = AccountSettingsVC()
        
        navigationController?.pushViewController(accountSettingsVC, animated: true)
        
    }
    

}
