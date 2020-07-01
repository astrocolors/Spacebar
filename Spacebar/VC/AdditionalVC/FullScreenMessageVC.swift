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
    var messages: [Data?] = []

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
        
        let user = Auth.auth().currentUser?.email
        
        //let user = userLogin.text!
        
        NetworkManager.shared.getUserSpecificMessages(for: user!) { (data, error) in
            
            if let error = error {
                
                print(error)
                
                
            }
            
            self.messages = data
            
            for item in self.messages {
                
                let data = item!
                
                let message = String(data: data, encoding: .utf16)
                
                print(message!)
                
            }
            
        }
        
        userMessage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            userMessage.topAnchor.constraint(equalTo: view.topAnchor),
            userMessage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userMessage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userMessage.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
    }


}