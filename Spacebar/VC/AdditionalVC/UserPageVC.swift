//
//  UserPageVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/29/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: "User-Page" - What a user sees every time they select another user

import UIKit
import BLTNBoard

class UserPageVC: UIViewController {
    
    let userLogin           = UILabel()
    let userBio             = UILabel()
    let userAvatar          = UIImageView()
    let userFollowing       = UILabel()
    let userFollowers       = UILabel()
    let followButton        = UIButton()
    let tableView           = UITableView()
    let containerView       = UIView()
    let refreshController   = UIRefreshControl()
    var segmentedController = UISegmentedControl()
    
    lazy var boardManager: BLTNItemManager = {
        
        let item = BLTNPageItem(title: "Options")
        
        item.actionButtonTitle = "Block User"
        item.alternativeButtonTitle = "Cancel"
        
        item.actionHandler = { _ in
            
            self.didTapBlockUser()
            
        }
        
        item.alternativeHandler = { _ in
            
            self.didTapCancel()
            
        }
        
        return BLTNItemManager(rootItem: item)
        
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureNavBar()
        configureUserAvatar()
        configureUserLogin()
        configureUserBio()
        configureFollowButton()
        //configureUserFollowers()
        //configureUserFollowing()
        configureSegmentedController()
        configureTableView()
        configureRefreshController()
        
    }
    
    func configureNavBar(){
        
        let reportItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(presentReportOptions))
        
        navigationItem.setRightBarButton(reportItem, animated: true)
        
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
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 140
        tableView.separatorInset = .zero
        tableView.register(MessagesCell.self, forCellReuseIdentifier: MessagesCell.reuseID)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: segmentedController.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
        
    }
    
    func configureRefreshController(){
        
        tableView.addSubview(refreshController)
        
        refreshController.addTarget(self, action: #selector(refreshMessages), for: .valueChanged)
        
    }
    
    func didTapBlockUser(){
        
        print("User Blocked")
        
        dismiss(animated: true)
        
    }
    
    func didTapCancel(){
        
        print("Cancel")
        
        dismiss(animated: true)
        
        
    }
    
    @objc func refreshMessages(){
        
        refreshController.endRefreshing()
        
    }
       
    @objc func presentReportOptions(){
        
        boardManager.showBulletin(above: self)
        
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

extension UserPageVC: UITableViewDelegate, UITableViewDataSource {
    
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
