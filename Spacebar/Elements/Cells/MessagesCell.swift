//
//  MessagesCell.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: These are the cells that pop up every time there is a message on the screen

import UIKit

protocol MessageCellDelegate { // Options for the boss
    
    func didPressReplyButton()
    func didPressRepostButton()
    func didPressStarButton()
    func didPressReportButton()
    
}

class MessagesCell: UITableViewCell {
    
    static let reuseID  = "MessageCell"
    let avatarImageView = SBAvatarImageView(frame: .zero)
    let usernameLabel   = SBTitleLabel()
    let messageLabel    = UILabel()
    let interStackView  = UIStackView()
    
    let replyButton     = UIButton()
    let repostButton    = UIButton()
    let starButton      = UIButton()
    let reportButton    = UIButton()
    let spacerButton    = UIButton()
    let spacerButtonV2  = UIButton()
    
    var delegate: MessageCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUserAvatar()
        configureUsernameLabel()
        configureMessageLabel()
        configureStackView()
        configureButtons()
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    private func configureUserAvatar(){
        
        addSubview(avatarImageView)
        
        avatarImageView.backgroundColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
        
        NSLayoutConstraint.activate([
            
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -15),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50)
            
        ])

        
    }
    
    private func configureUsernameLabel(){
        
        addSubview(usernameLabel)
        
        usernameLabel.text = "@Astronaut"
        
        NSLayoutConstraint.activate([
            
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            usernameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -30)
            
        ])
        
    }
    
    private func configureMessageLabel(){
        
        addSubview(messageLabel)
        
        messageLabel.text = "Testing out the message label. Testing out the message label. Testing out the message label."
        
        messageLabel.translatesAutoresizingMaskIntoConstraints  = false
        messageLabel.numberOfLines                              = 2 // This needs to be changed
        messageLabel.lineBreakMode                              = .byWordWrapping
        
        NSLayoutConstraint.activate([
            
            messageLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            messageLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            
        ])
        
        
        
    }
    
    private func configureStackView(){
        
        addSubview(interStackView)
        
        interStackView.translatesAutoresizingMaskIntoConstraints = false
        
        interStackView.axis = NSLayoutConstraint.Axis.horizontal
        interStackView.distribution = .equalSpacing
        
        interStackView.addArrangedSubview(spacerButton)
        interStackView.addArrangedSubview(replyButton)
        interStackView.addArrangedSubview(repostButton)
        interStackView.addArrangedSubview(starButton)
        interStackView.addArrangedSubview(reportButton)
        interStackView.addArrangedSubview(spacerButtonV2)
        
        NSLayoutConstraint.activate([
            
            interStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            interStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            interStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            interStackView.heightAnchor.constraint(equalToConstant: 30)
            
        ])

        
        
    }
    
    func configureButtons(){
        
        replyButton.setImage(UIImage(systemName: "arrowshape.turn.up.left"), for: .normal)
        repostButton.setImage(UIImage(systemName: "repeat"), for: .normal)
        starButton.setImage(UIImage(systemName: "heart"), for: .normal)
        reportButton.setImage(UIImage(systemName: "exclamationmark.triangle"), for: .normal)
        
        replyButton.addTarget(self, action: #selector(pushReplyScreenVC), for: .touchUpInside)
        repostButton.addTarget(self, action: #selector(pushRepostButton), for: .touchUpInside)
        starButton.addTarget(self, action: #selector(pushStarButton), for: .touchUpInside)
        reportButton.addTarget(self, action: #selector(pushReportPostVC), for: .touchUpInside)
        
    }
    
    @objc func pushReplyScreenVC(){
        
        delegate?.didPressReplyButton()
        
    }
    
    @objc func pushRepostButton(){
        
        delegate?.didPressRepostButton()
        
    }
    
    @objc func pushStarButton(){
        
        delegate?.didPressStarButton()
        
    }
    
    @objc func pushReportPostVC(){
        
        delegate?.didPressReportButton()
        
    }
    
}
