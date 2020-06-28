//
//  SideMenuCell.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/27/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: These are the cells displayed each time the sideMenu is called

import UIKit

class SideMenuCell: UITableViewCell {
    
    static let reuseID = "Orbiters"
    let userAvatar = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    let userLogin = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        configureUserAvatar()
        configureUserLogin()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUserAvatar(){
        
        userAvatar.contentMode                                  = .scaleAspectFit
        userAvatar.clipsToBounds                                = true
        userAvatar.layer.masksToBounds                          = true
        userAvatar.layer.cornerCurve                            = CALayerCornerCurve.circular
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
    
    func configureUserLogin(){
        
        
        
        
        
    }
    
}
