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

        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)

        configureNavBar()
        configureTableView()
        
    }
    
    func configureNavBar(){
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
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
        
        tableView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)

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
        
        cell.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        
        return cell
        
    }
    
}
