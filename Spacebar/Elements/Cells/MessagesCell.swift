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
    let interStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUserAvatar()
        configureUsernameLabel()
        configureMessageLabel()
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureUserAvatar(){
        
        addSubview(avatarImageView)
        
        avatarImageView.backgroundColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
        
        NSLayoutConstraint.activate([
            
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50)
            
        ])

        
    }
    
    private func configureUsernameLabel(){
        
        addSubview(usernameLabel)
        
        usernameLabel.text = "@Astronaut"
        
        NSLayoutConstraint.activate([
            
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            usernameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20)
            
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
    
    private func configureStackView(){
        
        let replyButton = UIButton()
        let repostButton = UIButton()
        let starButton = UIButton()
        let reportButton = UIButton()
        
        replyButton.setImage(UIImage(systemName: "film"), for: .normal)
        repostButton.setImage(UIImage(systemName: "person"), for: .normal)
        starButton.setImage(UIImage(systemName: "film.fill"), for: .normal)
        reportButton.setImage(UIImage(systemName: "person.fill"), for: .normal)
        
        
        addSubview(interStackView)
        
        interStackView.translatesAutoresizingMaskIntoConstraints = false
        
        interStackView.axis = NSLayoutConstraint.Axis.horizontal
        
        interStackView.addArrangedSubview(replyButton)
        interStackView.addArrangedSubview(repostButton)
        interStackView.addArrangedSubview(starButton)
        interStackView.addArrangedSubview(reportButton)
        
        
        NSLayoutConstraint.activate([
            
            interStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            interStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            interStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            interStackView.heightAnchor.constraint(equalToConstant: 30)
            
        ])

        
        
    }
    
}
