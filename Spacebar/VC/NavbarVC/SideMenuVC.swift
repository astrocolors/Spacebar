//
//  SideMenuVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: This is the side menu that pops up every time the hamburger icon is pressed (3 horizonal lines)

import UIKit
import Firebase
import FirebaseStorage

class SideMenuVC: UIViewController {
    
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        configureNavBar()
        configureTableView()
        
    }
    
    func configureNavBar(){
        
        navigationController?.navigationBar.barTintColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Following"
        navigationController?.hidesBarsOnSwipe = true
        
    }
    
    func configureTableView(){
        
        tableView                       = UITableView()
        view.addSubview(tableView)
        tableView.rowHeight             = 60
        tableView.separatorStyle        = .none
        tableView.delegate              = self
        tableView.dataSource            = self
        tableView.register(SideMenuCell.self, forCellReuseIdentifier: SideMenuCell.reuseID)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)

        ])
        
    }
    
}

extension SideMenuVC: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 40
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuCell.reuseID, for: indexPath) as! SideMenuCell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
}
