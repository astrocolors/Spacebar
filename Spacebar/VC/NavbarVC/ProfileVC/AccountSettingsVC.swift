//
//  AccountSettingsVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: View controller seen every time a user checks their settings

import UIKit
import Firebase

class AccountSettingsVC: UIViewController {
    
    var settingsTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)

        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        configureTableView()
    }
    
    func configureTableView(){
        
        view.addSubview(settingsTableView)
        
        settingsTableView.rowHeight = 50
        //settingsTableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        settingsTableView.separatorStyle = .singleLine
        settingsTableView.separatorInset = .zero
        settingsTableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.reuseID)
        
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            settingsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            settingsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingsTableView.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
        
    }

}

extension AccountSettingsVC: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseID, for: indexPath) as! SettingsCell
        
        cell.settingsLabel.text = cell.settingsChoices[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("You tapped cell number \(indexPath.row).") // Remove at some point
        
        if (indexPath.row == 3) {
            
            do {
                try Auth.auth().signOut()
                print("Signed Out!")
                
            } catch let err {
                
                print(err)
                
            }
            
        }
        
    }
    
}
