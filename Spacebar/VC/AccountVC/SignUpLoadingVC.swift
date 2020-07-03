//
//  SignUpLoadingVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: Loading screen seen when signing up

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class SignUpLoadingVC: UIViewController { // will change
    
    var username: String?
    var password: String?
    var firstname: String?
    var lastname: String?
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        addNewUserToDatabase()
        configureNewUser()
        
        // Add custom animation here
        
        
    }
    
    func configure(){
        
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
    
    func addNewUserToDatabase(){
        
        let db = Firestore.firestore()
        
        db.collection("Users").addDocument(data: ["Firstname": firstname!, "Lastname": lastname!, "Username": username!]) { (error) in
            
            if (error != nil) {
                
                self.navigationController?.popViewController(animated: true)
                
            }
            
        }
        
        configureNewUser()
                
        transitionHomeVC()
        
    }
    
    func configureNewUser(){
        
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        
        changeRequest?.displayName = username
        
        changeRequest?.commitChanges(completion: { (error) in
            
            print(error?.localizedDescription)
            
            
        })
        
        Auth.auth().currentUser?.reload(completion: { (error) in
            if let error = error {
                
                print(error.localizedDescription)
                
                
            }
        })
        
    }
    
    func transitionHomeVC(){
        
        self.dismiss(animated: true)
        
    }

}
