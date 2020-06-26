//
//  SearchUsersCell.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit

class SearchUsersCell: UICollectionViewCell {
    
    static let reuseID = "SearchUserCell"
    
    let avatarImageView = SBAvatarImageView(frame: .zero)
    let usernameLabel = SBTitleLabel() // Adjust title label class and set to custom label - Still needs to be adjusted
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(searchUser: SearchUser) {
        
        usernameLabel.text = searchUser.login
        
    }
    
    private func configure(){
        
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            
            usernameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 12),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        
        
    }
    
}
