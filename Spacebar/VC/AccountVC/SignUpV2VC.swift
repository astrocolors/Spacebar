//
//  SignUpV2VC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: Allow users to enter unique username

import UIKit

class SignUpV2VC: UIViewController {
    
    // Temporary storage variables
    
    var firstname: String?
    var lastname: String?
    var email: String?
    
    let emailTextField = SBTextField(Text: "Email", ReturnType: .next, KeyboardType: .emailAddress)
    let usernameTextField = SBTextField(Text: "Username", ReturnType: .next, KeyboardType: .twitter)
    let nextButton = SBButton(Text: "Next", Color: #colorLiteral(red: 0.1960784314, green: 0.7215686275, blue: 0.3176470588, alpha: 1))
    let errorLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.1137254902, blue: 0.2784313725, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configureEmailTextField()
        configureUsernameTextField()
        configureNextButton()
        configureErrorLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        // Add custom animation here
        
        
    }
    
    func configureEmailTextField(){
        
        view.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
    }
    
    func configureUsernameTextField(){
        
        view.addSubview(usernameTextField)
        
        NSLayoutConstraint.activate([
        
            usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
        
        
    }
    
    func configureNextButton(){
        
        view.addSubview(nextButton)
        
        nextButton.addTarget(self, action: #selector(pushSignUpV3VC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
        
            nextButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 600),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])

        
    }
    
    func configureErrorLabel(){
        
        view.addSubview(errorLabel)
        
        errorLabel.text = "Error"
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textAlignment = .center
        errorLabel.isEnabled = true
        errorLabel.textColor = .red
        errorLabel.alpha = 0
        
        NSLayoutConstraint.activate([
            
            errorLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 400),
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            errorLabel.heightAnchor.constraint(equalToConstant: 50)
            
        ])

    }
    
    @objc func pushSignUpV3VC(){
        
        if Utilities.isTextFieldValid(TextField: usernameTextField) == true {
            
            let signUpV3VC = SignUpV3VC()
            
            signUpV3VC.firstname    = firstname
            signUpV3VC.lastname     = lastname
            signUpV3VC.username     = usernameTextField.text!
            signUpV3VC.email        = emailTextField.text!
            
            navigationController?.pushViewController(signUpV3VC, animated: true)
            
        }
        
        else {
            
            errorLabel.text = "Mission failed: Please fill in all fields before launching! - Houston"
            errorLabel.alpha = 1
            
        }

        
    }


}
