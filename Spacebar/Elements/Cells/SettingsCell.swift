//
//  SettingsCell.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/29/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {

    static let reuseID = "SettingsCell"
    let settingsLabel = UILabel()
    
    static let settingsChoices: [String] = ["About", "Help", "User Permissions", "Notifications","Terms of Service", "Privacy Policy", "Logout"]
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSettingsLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSettingsLabel(){
        
        addSubview(settingsLabel)
        
        settingsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            settingsLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            settingsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            settingsLabel.heightAnchor.constraint(equalToConstant: 50),
            settingsLabel.widthAnchor.constraint(equalToConstant: bounds.width)
            
        ])
        
        
        
        
    }
    
}
