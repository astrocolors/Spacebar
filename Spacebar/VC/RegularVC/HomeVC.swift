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

class HomeVC: UIViewController {
    
    enum Section{
        
        case Main // What the hell is this?
        
    }
    
    var tableView = UITableView()
    let refreshControl = UIRefreshControl()
    var messages: [message] = [] // What is this for?
    var delegate: ViewControllerDelegate?
    let loginButton = SBButtonV2(Text: "Login", Color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), CornerRadius: 0) // Remove this

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        configureLoginButton() // temporary
        configureTableView()
        configureRefreshController()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
    
    func configureNavBar(){
        
        let image: UIImage = UIImage(named: "Astronaut")!
        let logo = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        logo.contentMode = .scaleAspectFit
        logo.image = image
        
        navigationController?.navigationBar.barTintColor    = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.hidesBarsOnSwipe              = true
        
        let messageItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(pushAddMessageVC))
        let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(pushSearchUsersVC))
        let sideMenuItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(pushSideMenuVC))
       
        
        //navigationItem.setRightBarButtonItems([messageItem, searchItem], animated: true)
        navigationItem.setRightBarButton(searchItem, animated: true)
        navigationItem.setLeftBarButton(sideMenuItem, animated: true)
        navigationItem.titleView = logo
        
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
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 140
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.separatorInset = .zero
        tableView.register(MessagesCell.self, forCellReuseIdentifier: "MessagesCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
    }
    
    func configureRefreshController(){
        
        tableView.addSubview(refreshControl)
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
        
        // Add stuff
        
    }
    
    
    func didPressReportButton() {
        
        let reportPostVC = ReportPostVC()
        
        navigationController?.pushViewController(reportPostVC, animated: true)
        
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessagesCell") as! MessagesCell
        
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        cell.delegate = self // Tells the boss who the intern (this view controller) is
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let fullScreenMessageVC = FullScreenMessageVC()
        
        navigationController?.pushViewController(fullScreenMessageVC, animated: true)
        
    } 
    
    
}

