//
//  HomeVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: Scrollable short messages and pictures

import UIKit
import Firebase
import FirebaseStorage
import SPPermissions

class HomeVC: UIViewController {
    
    enum Section{
        
        case Main // What the hell is this?
        
    }
    
    var messagesTable = UITableView()
    let refreshControl = UIRefreshControl()
    var messages: [message] = [] // What is this for?
    var delegate: ViewControllerDelegate?
    let loginButton = SBButtonV2(Text: "Login", Color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), CornerRadius: 0) // Remove this

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePermissions()
        configureNavBar()
        configureLoginButton() // temporary
        configureTableView()
        configureRefreshController()
 

        view.backgroundColor = .systemBackground
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Deselects the selected tableview cell ~smoothly~
        
        let selectedRow: IndexPath? = messagesTable.indexPathForSelectedRow
        if let selectedRowNotNill = selectedRow {
            messagesTable.deselectRow(at: selectedRowNotNill, animated: true)
            
        }
        
    }
    
    func configurePermissions(){
        
        let controller = SPPermissions.list([.camera, .locationWhenInUse, .microphone])
        
        controller.titleText = "Permissions"
        controller.headerText = "In order for you to have the best experience, there are a few things we need to be able to access:"
        
        let cameraState = SPPermission.camera.isAuthorized
        let locationState = SPPermission.locationWhenInUse.isAuthorized
        let microphoneState = SPPermission.microphone.isAuthorized
        
        if (cameraState == false || locationState == false || microphoneState == false) {
            
            controller.present(on: self)
            
        }
    
    }
    
    func configureNavBar(){
        
        let image: UIImage = UIImage(named: "Astronaut")!
        let logo = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        logo.contentMode = .scaleAspectFit
        logo.image = image
        
        navigationController?.navigationBar.barTintColor    = .systemBackground
        navigationController?.hidesBarsOnSwipe              = true
        
        let messageItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(pushAddMessageVC))
        let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(pushSearchUsersVC))
        let sideMenuItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(pushSideMenuVC))
       
        
        //navigationItem.setRightBarButtonItems([messageItem, searchItem], animated: true)
        navigationItem.setRightBarButton(searchItem, animated: true)
        navigationItem.setLeftBarButton(sideMenuItem, animated: true)
        //navigationItem.titleView = logo
        
    }
    
    func configureLoginButton(){
        
        // Remove at some point
        
        view.addSubview(loginButton)
        
        loginButton.addTarget(self, action: #selector(pushInitialScreen), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            loginButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
    }
    
    
    func configureTableView(){
        
        messagesTable.delegate = self
        messagesTable.dataSource = self
        messagesTable.rowHeight = 140
        messagesTable.separatorInset = .zero
        messagesTable.register(MessagesCell.self, forCellReuseIdentifier: "MessagesCell")
        messagesTable.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(messagesTable)
        
        NSLayoutConstraint.activate([
            
            messagesTable.topAnchor.constraint(equalTo: view.topAnchor),
            messagesTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            messagesTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            messagesTable.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
    }
    
    func configureRefreshController(){
        
        messagesTable.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refreshMessages), for: .valueChanged)
        
    }
    
    
    @objc func pushSideMenuVC(){
        
        delegate?.sideMenuToggle()
        
    }
    
    @objc func pushAddMessageVC(){
        
        let addMessageVC = AddMessageVC()
        
        navigationController?.pushViewController(addMessageVC, animated: true)
        
    }
    
    @objc func pushSearchUsersVC(){
        
        let searchUsersVC = SearchUsersVC()
        
        navigationController?.pushViewController(searchUsersVC, animated: true)
        
        
    }
    
    @objc func refreshMessages(){
        
        print("Messages Refreshed")
        
        self.refreshControl.endRefreshing()
        
    }
    
    @objc func pushInitialScreen(){
        
        let initialScreen = UINavigationController(rootViewController: InitialScreen())
        
        initialScreen.modalPresentationStyle = .fullScreen
        
        present(initialScreen, animated: true)
                
    }
    
}

extension HomeVC: MessageCellDelegate {
    
    func didPressUserAvatar() {
        
        let userPageVC = UserPageVC()
        
        navigationController?.pushViewController(userPageVC, animated: true)
        
    }
    
    func didPressReplyButton() {
        
        let replyVC = ReplyVC()
        
        present(replyVC, animated: true)
        
    }
    
    func didPressRepostButton() {
        
        // Add stuff
        
    }
    
    func didPressStarButton() {
        
        
        
    }
    
    
    func didPressShareButton() {
        
        let shareMessage = UIActivityViewController(activityItems: ["@Astronaut - "], applicationActivities: nil)
        
        present(shareMessage, animated: true, completion: nil)
        
        
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessagesCell") as! MessagesCell
        
        cell.delegate = self // Tells the boss who the intern (this view controller) is
        
        return cell
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let fullScreenMessageVC = FullScreenMessageVC()
        
        navigationController?.pushViewController(fullScreenMessageVC, animated: true)
        
    } 
    
    
}

