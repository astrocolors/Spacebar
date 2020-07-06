//
//  ReplyVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 7/6/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit
import KMPlaceholderTextView

class ReplyVC: UIViewController {
    
    let userAvatar = UIImageView()
    let userLabel = UILabel()
    let textView = KMPlaceholderTextView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
        
        configureUserAvatar()
        configureUserLabel()
        configureTextView()
        
    }
    
    func configureUserAvatar(){
        
        view.addSubview(userAvatar)
        
        userAvatar.image = UIImage(named: "Spacebar")
        userAvatar.layer.cornerRadius = 20
        userAvatar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            userAvatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            userAvatar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            userAvatar.heightAnchor.constraint(equalToConstant: 40),
            userAvatar.widthAnchor.constraint(equalToConstant: 40)
            
        ])
        
    }
    
    func configureUserLabel(){
        
        view.addSubview(userLabel)
        
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        
        userLabel.text = "Astronaut"
        
        NSLayoutConstraint.activate([
            
            userLabel.topAnchor.constraint(equalTo: userAvatar.topAnchor, constant: 10),
            userLabel.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 15),
            
        ])
        
        
    }
    
    func configureTextView(){
        
        view.addSubview(textView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        textView.font = UIFont(name: "Times New Roman", size: 18)
        
        textView.placeholder = "Reply..."
        
        NSLayoutConstraint.activate([
            
            textView.topAnchor.constraint(equalTo: userAvatar.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: userLabel.leadingAnchor, constant: -5),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            textView.heightAnchor.constraint(equalToConstant: 400)
            
        ])
        
    }

}
