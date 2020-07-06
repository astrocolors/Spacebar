//
//  UserPageVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/29/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: "User-Page" - What a user sees every time they select another user

import UIKit

class UserPageVC: UIViewController {
    
    let userLogin = UILabel()
    let userBio = UILabel()
    let userAvatar = UIImageView()
    let userFollowing = UILabel()
    let userFollowers = UILabel()
    let followButton = UIButton()
    var segmentedController = UISegmentedControl()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        
        configureNavBar()
        configureUserAvatar()
        configureUserLogin()
        configureUserBio()
        configureFollowButton()
        configureUserFollowers()
        configureUserFollowing()
        configureSegmentedController()
        configureTableView()
        
    }
    
    func configureNavBar(){
        
        //let sideMenuItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(pushSideMenuVC))
        
        //navigationController?.navigationItem.setRightBarButton(<#T##item: UIBarButtonItem?##UIBarButtonItem?#>, animated: <#T##Bool#>)
        
        
        
    }
    
    func configureUserLogin(){
        
        view.addSubview(userLogin)
        
        userLogin.translatesAutoresizingMaskIntoConstraints = false
        
        userLogin.text = "Astronaut"
        
        NSLayoutConstraint.activate([
            
            userLogin.topAnchor.constraint(equalTo: userAvatar.topAnchor),
            userLogin.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 10),
            userLogin.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        
    }
    
    func configureUserBio(){
        
        view.addSubview(userBio)
        
        userBio.translatesAutoresizingMaskIntoConstraints = false
        userBio.numberOfLines = 0
        userBio.lineBreakMode = .byWordWrapping
        
        userBio.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco"
        
        
        NSLayoutConstraint.activate([
            
            userBio.topAnchor.constraint(equalTo: userLogin.bottomAnchor, constant: 10),
            userBio.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 10),
            userBio.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        ])
        
    }
    
    func configureUserAvatar(){
        
        view.addSubview(userAvatar)
        
        userAvatar.translatesAutoresizingMaskIntoConstraints = false
        
        userAvatar.backgroundColor = .blue
        userAvatar.layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            
            userAvatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            userAvatar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userAvatar.heightAnchor.constraint(equalToConstant: 40),
            userAvatar.widthAnchor.constraint(equalToConstant: 40)
            
        ])

        
    }
    
    func configureFollowButton(){
        
        let followButton = UIButton()
        view.addSubview(followButton)
        
        followButton.setTitle("Follow", for: .normal)
        
        followButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            followButton.topAnchor.constraint(equalTo: view.topAnchor),
            followButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            followButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            followButton.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
    }
    
    func configureUserFollowers(){
        
        let userFollowers = UIButton()
        
        view.addSubview(userFollowers)
        userFollowers.setTitle("80", for: .normal)
        userFollowers.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            
            userFollowers.topAnchor.constraint(equalTo: userLogin.topAnchor, constant: 8),
            userFollowers.leadingAnchor.constraint(equalTo: userLogin.leadingAnchor, constant: 100),
            userFollowers.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userFollowers.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        
    }
    
    
    func configureUserFollowing(){
        
        let userFollowing = UIButton()
        
        view.addSubview(userFollowing)
        
        userFollowing.setTitle("40", for: .normal)
        
        userFollowing.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            userFollowing.topAnchor.constraint(equalTo: view.topAnchor),
            userFollowing.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userFollowing.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userFollowing.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
    }
    
    func configureSegmentedController(){
        
        let mediaType = ["", "", "", ""]
        segmentedController = UISegmentedControl(items: mediaType)
        segmentedController.translatesAutoresizingMaskIntoConstraints = false
        
        segmentedController.setImage(UIImage(systemName: "text.bubble.fill"), forSegmentAt: 0)
        segmentedController.setImage(UIImage(systemName: "film.fill"), forSegmentAt: 1)
        segmentedController.setImage(UIImage(systemName: "play.rectangle.fill"), forSegmentAt: 2)
        segmentedController.setImage(UIImage(systemName: "hand.draw.fill"), forSegmentAt: 3)
        
        segmentedController.addTarget(self, action: #selector(mediaSelection(segmentedControl:)), for: .valueChanged)
        segmentedController.selectedSegmentIndex = 0
        
        view.addSubview(segmentedController)
        
        NSLayoutConstraint.activate([
            
            segmentedController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedController.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            segmentedController.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            segmentedController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200)
            
        ])
        
        
    }
    
    func configureTableView(){
        
        let tableView = UITableView()
        
        view.addSubview(tableView)
        
        tableView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        
        tableView.rowHeight = 60
        tableView.separatorInset = .zero
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: segmentedController.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
        
        
    }
    
    @objc func mediaSelection(segmentedControl: UISegmentedControl){
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            userAvatar.image = UIImage(named: "Heartbreak")
        case 1:
            userAvatar.image = UIImage(named: "ElonMusk")
        case 2:
            userAvatar.image = UIImage(named: "Moon")
        default:
            userAvatar.image = UIImage(named: "Spacebar")
        }
        
        
    }


}
