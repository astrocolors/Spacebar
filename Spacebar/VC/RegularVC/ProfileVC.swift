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
    
    let userAvatar = UIImageView()
    let userLabel = UILabel()
    var delegate: ViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.1137254902, blue: 0.2784313725, alpha: 1)
        
        configureNavBar()
        configureUserAvatar()
        configureUserLabel()
        configureSegmentedController()
        
    }
    
    func configureNavBar(){
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let accountSettingsItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(pushAccountSettingsVC)) 
        
        let sideMenuItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(pushSideMenuVC))
        
        navigationItem.setRightBarButton(accountSettingsItem, animated: true)
        navigationItem.setLeftBarButton(sideMenuItem, animated: true)

    }
    
    func configureUserAvatar(){
        
        view.addSubview(userAvatar)
        
        userAvatar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            userAvatar.topAnchor.constraint(equalTo: view.topAnchor),
            userAvatar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userAvatar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userAvatar.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
        
        
    }
    
    func configureUserLabel(){
        
        view.addSubview(userLabel)
        
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            userLabel.topAnchor.constraint(equalTo: view.topAnchor),
            userLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userLabel.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
        
    }
    
    func configureSegmentedController(){
        
        let mediaType = ["Photos", "Clips", "Videos", "Interactions"]
        let segmentedController = UISegmentedControl(items: mediaType)
        
        segmentedController.selectedSegmentIndex = 0
        segmentedController.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedController)
        
        
        NSLayoutConstraint.activate([
            
            segmentedController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedController.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            segmentedController.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            segmentedController.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
        
    }
    
    @objc func pushSideMenuVC(){
        
       delegate?.sideMenuToggle()
        
    }
    
    @objc func pushAccountSettingsVC(){
        
        let accountSettingsVC = AccountSettingsVC()
        
        navigationController?.pushViewController(accountSettingsVC, animated: true)
        
    }
    

}
