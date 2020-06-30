//
//  FullScreenMessageVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/29/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit

class FullScreenMessageVC: UIViewController {
    
    let userAvatar = UIImageView()
    let userMessage = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)

        configureUserAvatar()
        configureUserMessage()
    }
    
    func configureUserAvatar(){
        
        view.addSubview(userAvatar)
        
        userAvatar.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            userAvatar.topAnchor.constraint(equalTo: view.topAnchor),
            userAvatar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userAvatar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userAvatar.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])

        
        
    }
    
    func configureUserMessage(){
        
        view.addSubview(userMessage)
        
        userMessage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            userMessage.topAnchor.constraint(equalTo: view.topAnchor),
            userMessage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userMessage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userMessage.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
    }


}
