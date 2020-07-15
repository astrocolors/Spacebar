//
//  AddMessageVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: This is the screen that pops up every time you want to post a message

import UIKit
import Firebase
import FirebaseStorage
import KMPlaceholderTextView

class AddMessageVC: UIViewController {
    
    var messageTextField = KMPlaceholderTextView()
    var keyboardToolbar = UIToolbar()
    var userAvatar = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureKeyboardToolbar()
        configureUserAvatar()
        configureTextField()

    }
    
    func configureKeyboardToolbar(){
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        
        let sendButton = UIBarButtonItem(title: "Launch!", style: .done, target: self, action: #selector(sendMessage))
        
        keyboardToolbar.sizeToFit()
        keyboardToolbar.isTranslucent = true
        
        keyboardToolbar.items = [flexibleSpace, flexibleSpace, sendButton]
        
        messageTextField.inputAccessoryView = keyboardToolbar
    
        
    }
    
    func configureTextField(){
        
        view.addSubview(messageTextField)
        
        // Remember to set the delegate
        
        messageTextField.translatesAutoresizingMaskIntoConstraints = false
        messageTextField.placeholder = "What would you like to say?"
        messageTextField.font = UIFont.preferredFont(forTextStyle: .body)
        messageTextField.becomeFirstResponder()
        
        messageTextField.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            
            messageTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            messageTextField.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 12),
            messageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            messageTextField.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 12)
            
        ])
        
    }
    
    func configureUserAvatar(){
        
        view.addSubview(userAvatar)
        
        userAvatar.backgroundColor = .blue
        userAvatar.layer.cornerRadius = 20
        
        userAvatar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            userAvatar.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            userAvatar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            userAvatar.heightAnchor.constraint(equalToConstant: 40),
            userAvatar.widthAnchor.constraint(equalToConstant: 40)
            
        ])
    
    }
    
    @objc func sendMessage(){
        
        let messageText = messageTextField.text
        
        HomeNM.shared.postMessages(Message: messageText)
        
        
    }

}
