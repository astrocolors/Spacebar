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

class AddMessageVC: UIViewController {
    
    var sendButton = SBButtonV2(Text: "Upload", Color: .blue, CornerRadius: 10)
    var getButton = SBButtonV2(Text: "Download", Color: .blue, CornerRadius: 10)
    var imageView = UIImageView(image: UIImage(named: "Spacebar.png"))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        
        configureSendButton()
        configureGetButton()
        configureImageView()
        
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
