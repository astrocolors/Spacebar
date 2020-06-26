//
//  InitialScreen.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit

class InitialScreen: UIViewController {
    
    let loginButton = SBButton(Text: "Login", Color: #colorLiteral(red: 0.1960784314, green: 0.7215686275, blue: 0.3176470588, alpha: 1))
    let signupButton = SBButton(Text: "Sign Up", Color: #colorLiteral(red: 0.1960784314, green: 0.7215686275, blue: 0.3176470588, alpha: 1))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureLoginButton()
        configureSignUpButton()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        

    }
    
    func configure(){
        
        view.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.1137254902, blue: 0.2784313725, alpha: 1)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let closeItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(popInitialViewController))
        
        navigationItem.setLeftBarButton(closeItem, animated: true)
        
    }
    
    
    func configureLoginButton(){
        
        view.addSubview(loginButton)
        
        loginButton.addTarget(self, action: #selector(pushLoginVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
        
            loginButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 520),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
    }
    
    func configureSignUpButton(){
        
        view.addSubview(signupButton)
        
        signupButton.addTarget(self, action: #selector(pushSignUpV1VC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
        
            signupButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 600),
            signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            signupButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
    }
    
    
    @objc func pushLoginVC(){
        
        let loginVC = LoginVC()
        
        navigationController?.pushViewController(loginVC, animated: true)
        
    }
    
    @objc func pushSignUpV1VC(){
        
        let signupV1VC = SignUpV1VC()
        
        navigationController?.pushViewController(signupV1VC, animated: true)
        
    }
    
    @objc func popInitialViewController(){
        
        dismiss(animated: true)
        
    }

}