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
    
    let userAvatar                      = UIImageView()
    let userLabel                       = UILabel()
    let editProfileButton               = UIButton()
    let tableView                       = UITableView()
    let segmentedController             = UISegmentedControl()
    var delegate: ViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        configureUserAvatar()
        configureUserLabel()
        configureEditProfileButton()
        configureSegmentedController()
        //configureTableView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        configureNavBar()
        
    }
    
    func configureNavBar(){
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.07450980392, green: 0.1137254902, blue: 0.3921568627, alpha: 1)
        
        let accountSettingsItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(pushAccountSettingsVC)) 
        
        let sideMenuItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(pushSideMenuVC))
        
        navigationItem.setRightBarButton(accountSettingsItem, animated: true)
        navigationItem.setLeftBarButton(sideMenuItem, animated: true)
        navigationItem.title = "@Username"

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
    
    func configureEditProfileButton(){
        
        view.addSubview(editProfileButton)
        
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            editProfileButton.topAnchor.constraint(equalTo: view.topAnchor),
            editProfileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            editProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            editProfileButton.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
    }
    
    func configureSegmentedController(){
        
        let mediaType = ["", "", "", ""]
        let segmentedController = UISegmentedControl(items: mediaType)
        
        segmentedController.setImage(UIImage(systemName: "text.bubble.fill"), forSegmentAt: 0)
        segmentedController.setImage(UIImage(systemName: "film.fill"), forSegmentAt: 1)
        segmentedController.setImage(UIImage(systemName: "play.rectangle.fill"), forSegmentAt: 2)
        segmentedController.setImage(UIImage(systemName: "hand.draw.fill"), forSegmentAt: 3)
        
        
        segmentedController.selectedSegmentIndex = 0
        segmentedController.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedController)
        
        
        NSLayoutConstraint.activate([
            
            segmentedController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedController.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            segmentedController.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            segmentedController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
        ])
        
    }
    
    func configureTableView(){
        
    
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: segmentedController.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
            
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
