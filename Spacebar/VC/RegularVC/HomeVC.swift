//
//  HomeVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: Scrollable short messages and pictures

import UIKit

class HomeVC: UIViewController {
    
    enum Section{
        
        case Main
        
    }
    
    var tableView = UITableView()
    var videos: [Video] = []
    var delegate: ViewControllerDelegate?
    let loginButton = SBButtonV2(Text: "Login", Color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), CornerRadius: 0)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.1137254902, blue: 0.2784313725, alpha: 1) 
        
        configureNavBar()
        configureLoginButton()
        //configureTableView()
        
    }
    
    func configureNavBar(){
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let messageItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(pushAddMessageVC))
        let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(pushSearchUsersVC))
        let sideMenuItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(pushSideMenuVC))
       
        
        navigationItem.setRightBarButtonItems([messageItem, searchItem], animated: true)
        navigationItem.setLeftBarButton(sideMenuItem, animated: true)
        
    }
    
    func configureLoginButton(){
        
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
        tableView.rowHeight = 100
        tableView.register(VideosCell.self, forCellReuseIdentifier: "VideoCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
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
    
    @objc func pushInitialScreen(){
        
        let initialScreen = UINavigationController(rootViewController: InitialScreen())
        
        initialScreen.modalPresentationStyle = .fullScreen
        
        present(initialScreen, animated: true)
        
    }

    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! VideosCell
        let video = videos[indexPath.row]
        
        cell.set(video: video)
        
        return cell
        
    }
    
    
}
