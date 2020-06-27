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

class SignUpLoadingVC: UIViewController {
    
    var username: String?
    var password: String?
    var firstname: String?
    var lastname: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        addNewUserToDatabase()
        
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
                
         transitionHomeVC()
        
    }
    
    func transitionHomeVC(){
        
        self.dismiss(animated: true)
        
    }

}
