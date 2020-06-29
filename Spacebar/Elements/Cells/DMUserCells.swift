//
//  DMUserCells.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: These are the user cells that pop up every time DM's are opened

import UIKit

class DMUserCells: UITableViewCell {
    
    static let reuseID = "DMUsers"
    let userAvatar = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    let userLogin = UILabel()
    let messagePreview = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUserAvatar()
        configureUserLogin()
        configureMessagePreview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureUserAvatar(){
        
        userAvatar.contentMode                                  = .scaleAspectFit
        userAvatar.clipsToBounds                                = true
        userAvatar.layer.masksToBounds                          = true
        userAvatar.layer.cornerCurve                            = CALayerCornerCurve.circular
        userAvatar.layer.cornerRadius                           = 20
        userAvatar.backgroundColor                              = .blue
        userAvatar.translatesAutoresizingMaskIntoConstraints    = false
        
        addSubview(userAvatar)
        
        NSLayoutConstraint.activate([

            userAvatar.centerYAnchor.constraint(equalTo: centerYAnchor),
            userAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            userAvatar.heightAnchor.constraint(equalToConstant: 40),
            userAvatar.widthAnchor.constraint(equalToConstant: 40)
            
        ])
        
    }
    
    func configureUserLogin(){
        
        addSubview(userLogin)
        
        userLogin.translatesAutoresizingMaskIntoConstraints = false
        userLogin.text = "@ShamikPatro"
        userLogin.textColor = .darkText
        userLogin.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        
        NSLayoutConstraint.activate([
            
            userLogin.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -8),
            userLogin.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 8),
            userLogin.trailingAnchor.constraint(equalTo: trailingAnchor),
            userLogin.heightAnchor.constraint(equalToConstant: 60),
            userLogin.widthAnchor.constraint(equalToConstant: 100)
            
        ])
        
        
    }
    
    func configureMessagePreview(){
        
        addSubview(messagePreview)
        
        messagePreview.translatesAutoresizingMaskIntoConstraints = false
        messagePreview.text = "Sent you a message"
        messagePreview.textColor = .darkGray
        messagePreview.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        
        NSLayoutConstraint.activate([
            
            messagePreview.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            messagePreview.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 8),
            messagePreview.trailingAnchor.constraint(equalTo: trailingAnchor),
            messagePreview.heightAnchor.constraint(equalToConstant: 60),
            messagePreview.widthAnchor.constraint(equalToConstant: 100)
            
        ])
        
        
    }
    
}
