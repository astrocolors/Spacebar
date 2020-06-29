//
//  AccountSettingsVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: View controller seen every time a user checks their settings

import UIKit

class AccountSettingsVC: UIViewController {
    
    var settingsTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        configureTableView()
    }
    
    func configureTableView(){
        
        view.addSubview(settingsTableView)
        
        settingsTableView.rowHeight = 50
        settingsTableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        settingsTableView.separatorStyle = .singleLine
        settingsTableView.separatorInset = .zero
        
        
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            settingsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            settingsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingsTableView.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
        
    }

}
