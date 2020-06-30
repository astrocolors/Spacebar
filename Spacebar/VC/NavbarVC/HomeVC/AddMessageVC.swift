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
    var sendButton = SBButtonV2(Text: "Upload", Color: .blue, CornerRadius: 10)
    var getButton = SBButtonV2(Text: "Download", Color: .blue, CornerRadius: 10)
    var imageView = UIImageView(image: UIImage(named: "Spacebar.png"))
    var keyboardToolbar = UIToolbar()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        
        //configureObservers()
        configureKeyboardToolbar()
        configureTextField()
        //configureSendButton()
        //configureGetButton()
        //configureImageView()
        
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
        
        messageTextField.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        
        NSLayoutConstraint.activate([
            
            messageTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            messageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            messageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            messageTextField.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 12)
            
        ])
        
    }
    
    
    func configureSendButton(){

        sendButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(sendButton)
        
        sendButton.addTarget(self, action: #selector(upload), for: .touchUpInside)

        NSLayoutConstraint.activate([
            
            sendButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 450),
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            sendButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        
    }
    
    func configureGetButton(){
        
        getButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(getButton)
        
        getButton.addTarget(self, action: #selector(download), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            getButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 520),
            getButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            getButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
    }
    
    func configureImageView(){
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            imageView.widthAnchor.constraint(equalToConstant: 50)
            
            
        ])

        
    }
    
    @objc func sendMessage(){
        
        // Network call
        
        print("Message Sent!")
        
        
        
    }
    
    @objc func upload(){
        
        let user: String? = Firebase.Auth.auth().currentUser?.email
                
        let uploadRef = Storage.storage().reference(withPath: "Users/\(user!)/Pictures/Elon.jpg")
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        guard let imageData = imageView.image?.jpegData(compressionQuality: 0.75) else { return }
        
        print(user!)
        
        uploadRef.putData(imageData, metadata: metadata)
        
    }
    
    @objc func download(){
        
        let user: String? = Firebase.Auth.auth().currentUser?.email
        
        let storageRef = Storage.storage().reference(withPath: "Users/\(user!)/Pictures/ElonMusk.jpg")
        
        storageRef.getData(maxSize: (4*1024*1024)) { [weak self] (data, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
                
                return
                
            }
            
            if let data = data {
                
                self?.imageView.image = UIImage(data: data)
                
            }
            
        }
        
    }

}

extension AddMessageVC {
    
    func configureObservers(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        guard let userInfo = notification.userInfo else { return }
        
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        
        let keyboardFrame = keyboardSize.cgRectValue
        
        if self.view.frame.origin.y == 0{
            self.view.frame.origin.y -= keyboardFrame.height
        }
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
        guard let userInfo = notification.userInfo else { return }
        
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        
        let keyboardFrame = keyboardSize.cgRectValue
        
        if self.view.frame.origin.y == 0{
            self.view.frame.origin.y += keyboardFrame.height
        }
        
        
        
    }

}
