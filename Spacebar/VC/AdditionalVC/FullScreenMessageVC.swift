//
//  FullScreenMessageVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/29/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit
import Firebase

class FullScreenMessageVC: UIViewController {
    
    let userAvatar = UIImageView()
    let userLogin = UILabel()
    let userMessage = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        configureNavBar()
        configureUserAvatar()
        configureUserLogin()
        configureUserMessage()
    }
    
    func configureNavBar(){
        
        let messageOptions = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector(presentMessageOptions))
        
        navigationItem.setRightBarButton(messageOptions, animated: true)
        
    }
    
    func configureUserAvatar(){
        
        view.addSubview(userAvatar)
        
        userAvatar.backgroundColor                              = .blue
        userAvatar.translatesAutoresizingMaskIntoConstraints    = false
        userAvatar.layer.cornerRadius                           = 20
        
        NSLayoutConstraint.activate([
            
            userAvatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            userAvatar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userAvatar.heightAnchor.constraint(equalToConstant: 40),
            userAvatar.widthAnchor.constraint(equalToConstant: 40)
            
        ])
        
    }
    
    func configureUserLogin(){
        
        view.addSubview(userLogin)
        
        userLogin.text                                      = "Astronaut"
        userLogin.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            userLogin.topAnchor.constraint(equalTo: userAvatar.topAnchor, constant: 10),
            userLogin.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 10)
            
        ])
        
    }
    
    func configureUserMessage(){
        
        view.addSubview(userMessage)
              
        userMessage.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        userMessage.translatesAutoresizingMaskIntoConstraints = false
        userMessage.numberOfLines = 6
        userMessage.lineBreakMode = .byWordWrapping
        
        
        NSLayoutConstraint.activate([
            
            userMessage.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 10),
            userMessage.leadingAnchor.constraint(equalTo: userLogin.leadingAnchor),
            userMessage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
        ])
        
    }
    
    @objc func presentMessageOptions(){
        
        print("Message Options")
        
    }


}
