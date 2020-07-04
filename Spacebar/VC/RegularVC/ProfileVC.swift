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
    
    var user: String?
    
    let userAvatar                      = UIImageView()
    let userLabel                       = UILabel()
    let userBio                         = UILabel()
    let editProfileButton               = UIButton()
    let tableView                       = UITableView()
    
    var segmentedController             = UISegmentedControl()
    var delegate: ViewControllerDelegate? // Is this necessary?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        user = ProfileNM.shared.getLogin()
        
        configureSegmentedController()
        configureUserAvatar()
        configureUserLabel()
        configureUserBio()
        //configureEditProfileButton() --> Make this look good
        configureTableView()
        configureNavBar()

    }
    
    func configureNavBar(){
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9198423028, green: 0.9198423028, blue: 0.9198423028, alpha: 1)
        
        let accountSettingsItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(pushAccountSettingsVC)) 
        
        let sideMenuItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(pushSideMenuVC))
        
        navigationItem.setRightBarButton(accountSettingsItem, animated: true)
        navigationItem.setLeftBarButton(sideMenuItem, animated: true)
        navigationItem.title = "@Username"

    }
    
    
    func configureUserAvatar(){
        
        view.addSubview(userAvatar)
        
        userAvatar.translatesAutoresizingMaskIntoConstraints = false
        userAvatar.layer.cornerRadius = 20
        userAvatar.backgroundColor = .blue
        
        NSLayoutConstraint.activate([
            
            userAvatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            userAvatar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userAvatar.heightAnchor.constraint(equalToConstant: 40),
            userAvatar.widthAnchor.constraint(equalToConstant: 40)
            
        ])
        
        
        
    }
    
    func configureUserLabel(){
        
        view.addSubview(userLabel)
        
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.text = "Astronaut"
        
        NSLayoutConstraint.activate([
            
            userLabel.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 10),
            userLabel.topAnchor.constraint(equalTo: userAvatar.topAnchor, constant: 10),
            
        ])
        
        
    }
    
    func configureUserBio(){
        
        view.addSubview(userBio)
        
        userBio.translatesAutoresizingMaskIntoConstraints = false
        userBio.numberOfLines = 0
        userBio.lineBreakMode = .byWordWrapping
        
        userBio.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco"
        
        NSLayoutConstraint.activate([
            
            userBio.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 10),
            userBio.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 10),
            userBio.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
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
        
        segmentedController = UISegmentedControl(items: mediaType)
        
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
            segmentedController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
        ])
        
    }
    
    func configureTableView(){
        
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        tableView.rowHeight = 60
        tableView.separatorInset = .zero

        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: segmentedController.bottomAnchor, constant: 5),
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
