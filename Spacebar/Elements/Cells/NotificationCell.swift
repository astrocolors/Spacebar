//
//  NotificationCell.swift
//  Spacebar
//
//  Created by Shamik Patro on 7/1/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {
    
    static let reuseID = "NotificationCell"
    
    let userAvatar = UIImageView()
    let notificationLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUserAvatar()
        configureNotiLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureUserAvatar(){
        
        userAvatar.contentMode                                  = .scaleAspectFit
        userAvatar.clipsToBounds                                = true
        userAvatar.layer.masksToBounds                          = true
        userAvatar.layer.cornerRadius                           = 15
        userAvatar.backgroundColor                              = .blue
        userAvatar.translatesAutoresizingMaskIntoConstraints    = false
        
        addSubview(userAvatar)
        
        NSLayoutConstraint.activate([
            userAvatar.centerYAnchor.constraint(equalTo: centerYAnchor),
            userAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            userAvatar.heightAnchor.constraint(equalToConstant: 30),
            userAvatar.widthAnchor.constraint(equalToConstant: 30)
            
        ])
            
    }
    
    func configureNotiLabel(){
        
        notificationLabel.translatesAutoresizingMaskIntoConstraints = false
        notificationLabel.text = "@username has liked your post."
        notificationLabel.adjustsFontSizeToFitWidth = true
        
        addSubview(notificationLabel)
        
        NSLayoutConstraint.activate([
            
            notificationLabel.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 8),
            notificationLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
        
    }
    
    
}
