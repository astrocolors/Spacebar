//
//  SignUpV3VC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
// Purpose: Allow users to enter password (repeat)

import UIKit
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class SignUpV3VC: UIViewController {
    
    // Temporary storage variables
    
    var firstname: String?
    var lastname: String?
    var username: String?
    
    let passwordTextField = SBTextField(Text: "Password", ReturnType: .continue, KeyboardType: .default)
    let passwordRepeatTextField = SBTextField(Text: "Repeat Password", ReturnType: .go, KeyboardType: .default)
    let launchButton = SBButton(Text: "Launch!", Color: #colorLiteral(red: 0.1960784314, green: 0.7215686275, blue: 0.3176470588, alpha: 1))
    let errorLabel = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.1137254902, blue: 0.2784313725, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configurePasswordTextField()
        configurePasswordRepeatTextField()
        configureLaunchButton()
        configureErrorLabel()
        
    }
    
    func configurePasswordTextField(){
        
        view.addSubview(passwordTextField)
        
        passwordTextField.isSecureTextEntry = true
        
        NSLayoutConstraint.activate([
        
            passwordTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
    }
    
    func configurePasswordRepeatTextField(){
        
        view.addSubview(passwordRepeatTextField)
        
        passwordRepeatTextField.isSecureTextEntry = true
        
        NSLayoutConstraint.activate([
        
            passwordRepeatTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            passwordRepeatTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordRepeatTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passwordRepeatTextField.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
    }
    
    func configureLaunchButton(){
        
        view.addSubview(launchButton)
        
        launchButton.addTarget(self, action: #selector(pushSignUpLoadingVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
        
            launchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 600),
            launchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            launchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            launchButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
        
    }
    
    func configureErrorLabel(){
        
        view.addSubview(errorLabel)
        
        errorLabel.text = "Error"
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textAlignment = .center
        errorLabel.isEnabled = true
        errorLabel.textColor = .red
        errorLabel.alpha = 1
        
        NSLayoutConstraint.activate([
            
            errorLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 400),
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            errorLabel.heightAnchor.constraint(equalToConstant: 50)
            
        ])

    }
    
    @objc func pushSignUpLoadingVC(){
        
        let signUpLoadingVC = SignUpLoadingVC()
        
        if Utilities.isTextFieldValid(TextField: passwordTextField) == true && Utilities.isTextFieldValid(TextField: passwordRepeatTextField) == true {
            
            if Utilities.isPasswordValid(Password: passwordTextField.text!) == true{
                
                if passwordTextField.text! == passwordRepeatTextField.text! {
                    
                    Auth.auth().createUser(withEmail: username!, password: passwordTextField.text!) { (result, error) in
                        
                        if (error != nil) {
                            
                            self.errorLabel.text = "Mission failed: Error creating user! - Houston"
                            self.errorLabel.alpha = 1
                            
                        }
                        
                        else {
                            
                            signUpLoadingVC.firstname   = self.firstname
                            signUpLoadingVC.lastname    = self.lastname
                            signUpLoadingVC.username    = self.username
                            signUpLoadingVC.password    = self.passwordTextField.text!
                             
                            self.navigationController?.pushViewController(signUpLoadingVC, animated: true)
                            
                        }
                        
                    }
                    
                }
                
                else {
                    
                    errorLabel.text = "Mission failed: Passwords must match! - Houston"
                    errorLabel.alpha = 1
                    
                    
                }
                
            }
            
            else{
             
                errorLabel.text = "Mission failed: Password must contain 8 characters, a special character, and a number. - Houston"
                errorLabel.alpha = 1
                
            }
            
        }
        
        else {
            
            errorLabel.text = "Mission failed: Please fill in all text fields before launching! - Houston"
            errorLabel.alpha = 1
            
        }
        
    }

}
