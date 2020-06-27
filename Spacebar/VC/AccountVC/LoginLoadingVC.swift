//
//  LoginLoadingVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: Loading screen seen when loging in

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class LoginLoadingVC: UIViewController {
    
    var username: String!
    var password: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        // Add custom animation here
        
    }
    
    func configure(){
        
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        transitionToHomeVC()
        
    }
    
    func transitionToHomeVC(){
        
        self.dismiss(animated: true)
        
    }
    



}
