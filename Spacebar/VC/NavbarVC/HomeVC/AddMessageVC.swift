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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        
        configureSendButton()
        
    }
    
    func configureSendButton(){
        
        sendButton.setTitle("Upload", for: .normal)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(sendButton)
        
        sendButton.addTarget(self, action: #selector(upload), for: .touchUpInside)

        NSLayoutConstraint.activate([
            
            sendButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 520),
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            sendButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        
    }
    
    @objc func upload(){
         
        let data = Data()
        let randomID = UUID.init().uuidString
        let upload = Storage.storage().reference(withPath: "messages/\(randomID)/temporary.txt")
        
        //upload.putFile(from: <#T##URL#>)
        
        
        
    }

}
