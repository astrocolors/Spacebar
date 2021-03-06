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
    
    var messages = [Data]()
    
    var user: String?
    
    let userAvatar                      = UIImageView()
    let userLabel                       = UILabel()
    let userBio                         = UILabel()
    let editProfileButton               = UIButton()
    let tableView                       = UITableView()
    let refreshController               = UIRefreshControl()
    
    var segmentedController             = UISegmentedControl()
    var delegate: ViewControllerDelegate? // Is this necessary?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureSegmentedController()
        configureUserAvatar()
        configureUserLabel()
        configureUserBio()
        //configureEditProfileButton() --> Make this look good
        configureTableView()
        configureNavBar()
        configureRefreshController()

    }
    
    func configureNavBar(){
        
        navigationController?.navigationBar.barTintColor = .systemBackground
        
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
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 140
        tableView.separatorInset = .zero
        tableView.register(MessagesCell.self, forCellReuseIdentifier: MessagesCell.reuseID)
        
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: segmentedController.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
    }
    
    func configureMessages(){
        
        ProfileNM.shared.getMessages { (messageData) in
            
            self.messages = messageData
            
        }
        
    }
    
    func configureRefreshController(){
        
        tableView.addSubview(refreshController)
        
        refreshController.addTarget(self, action: #selector(refreshMessages), for: .valueChanged)
        
    }
    
    @objc func pushSideMenuVC(){
        
       delegate?.sideMenuToggle()
        
    }
    
    @objc func pushAccountSettingsVC(){
        
        let accountSettingsVC = AccountSettingsVC()
        
        navigationController?.pushViewController(accountSettingsVC, animated: true)
        
    }
    
    @objc func refreshMessages(){
        
        configureMessages()
        
        refreshController.endRefreshing()
        
        
    }

}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {


        return 10


    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let repostAction = UIContextualAction(style: .normal, title: nil) { (action, view, handler) in
            
            print("Repost")
            
            handler(true)
            
        }
        
        repostAction.backgroundColor = #colorLiteral(red: 0.03529411765, green: 0.6154810469, blue: 0.06274509804, alpha: 1)
        
        repostAction.image = UIImage(systemName: "repeat")
        
        let swipeActions = UISwipeActionsConfiguration(actions: [repostAction])
        
        return swipeActions
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let likeAction = UIContextualAction(style: .normal, title: nil) { (action, view, handler) in
            
            handler(true)
            
        }
        
        likeAction.image = UIImage(systemName: "star.fill")
        
        likeAction.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.8764484497, blue: 0.01960784314, alpha: 1)
        
        let swipeActions = UISwipeActionsConfiguration(actions: [likeAction])
        
        return swipeActions
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell") as! MessagesCell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let fullScreenMessageVC = FullScreenMessageVC()
        
        navigationController?.pushViewController(fullScreenMessageVC, animated: true)
        
    }

}
