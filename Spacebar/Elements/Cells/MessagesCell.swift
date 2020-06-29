//
//  MessagesCell.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: These are the cells that pop up every time there is a message on the screen

import UIKit

class MessagesCell: UITableViewCell {
    
    static let reuseID = "MessageCell"
    let avatarImageView = SBAvatarImageView(frame: .zero)
    let usernameLabel = SBTitleLabel()
    let messageLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUserAvatar()
        configureUsernameLabel()
        configureMessageLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureUserAvatar(){
        
        addSubview(avatarImageView)
        
        avatarImageView.backgroundColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
        
        NSLayoutConstraint.activate([
            
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60)
            
        ])

        
    }
    
    private func configureUsernameLabel(){
        
        addSubview(usernameLabel)
        
        usernameLabel.text = "@Astronaut"
        
        NSLayoutConstraint.activate([
            
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            usernameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10)
            
        ])
        
    }
    
    private func configureMessageLabel(){
        
        addSubview(messageLabel)
        
        messageLabel.text = "Testing out the message label."
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            messageLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            messageLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5)
            
        ])
        
        
        
    }
    
}
