//
//  SearchUsersCell.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: These are the individual cells that pop up every time a user is searched on the search page

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
        avatarImageView.downloadImage(from: searchUser.avatarUrl!)
        
    }
    
    private func configure(){
        
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            avatarImageView.trailingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 120),
            avatarImageView.heightAnchor.constraint(equalToConstant: 80),
            avatarImageView.widthAnchor.constraint(equalToConstant: 80)
            
        ])
        
        NSLayoutConstraint.activate([
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            usernameLabel.heightAnchor.constraint(equalTo: avatarImageView.heightAnchor, constant: 8)
            
        ])
        
        
    }
    
}
