//
//  SideMenuVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: This is the side menu that pops up every time the hamburger icon is pressed (3 horizonal lines)

import UIKit

class SideMenuVC: UIViewController {
    
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        
        //configureTableView()
        
    }
    
    func configureTableView(){
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SideMenuCell.self, forCellReuseIdentifier: SideMenuCell.reuseID)
        
        tableView.backgroundColor = .green
        
        view.addSubview(tableView)
        view.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        return 4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuCell.reuseID, for: indexPath) as! SideMenuCell
        
        cell.backgroundColor = .blue
        
        return cell
        
    }
    
}
