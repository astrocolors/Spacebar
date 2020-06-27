//
//  LoginVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: Login screen

import UIKit
import AVKit
import AVFoundation
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class LoginVC: UIViewController {
    
    let usernameTextField = SBTextField(Text: "Username", ReturnType: .continue, KeyboardType: .default)
    let passwordTextField = SBTextField(Text: "Password", ReturnType: .next, KeyboardType: .default)
    let loginButton = SBButton(Text: "Launch!", Color: #colorLiteral(red: 0.1960784314, green: 0.7215686275, blue: 0.3176470588, alpha: 1))
    let errorLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.1137254902, blue: 0.2784313725, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configureUsernameTextfield()
        configurePasswordTextField()
        configureLoginButton()
        configureErrorLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // add custom animation here
        
    }
    
    func createDismissKeyboardTapGesture(){
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        
        view.addGestureRecognizer(tap)
    }
    
    func configureUsernameTextfield(){
        
        view.addSubview(usernameTextField)
        
        NSLayoutConstraint.activate([
        
            usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
    }
    
    func configurePasswordTextField(){
        
        passwordTextField.isSecureTextEntry = true
        
        view.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
        
            passwordTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    
    }
    
    func configureErrorLabel(){
        
        view.addSubview(errorLabel)
        
        errorLabel.text = "Error"
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textAlignment = .center
        errorLabel.textColor = .red
        errorLabel.alpha = 0
        
        NSLayoutConstraint.activate([
            
            errorLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 400),
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            errorLabel.heightAnchor.constraint(equalToConstant: 50)
            
        ])

    }
    
    
    func configureLoginButton(){
        
        loginButton.addTarget(self, action: #selector(pushLoadingVC), for: .touchUpInside)
        
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
        
            loginButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 600),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
    
    
    @objc func pushLoadingVC(){
        
        let loadingVC = LoginLoadingVC()
        
        if Utilities.isTextFieldValid(TextField: usernameTextField) == true && Utilities.isTextFieldValid(TextField: passwordTextField ) == true {
            
            Auth.auth().signIn(withEmail: usernameTextField.text!, password: passwordTextField.text!) { (result, error) in
                
                if error != nil {
                    
                    self.errorLabel.text = error!.localizedDescription
                    self.errorLabel.alpha = 1
                    
                }
                
                else {
                    
                    loadingVC.username = self.usernameTextField.text!
                    loadingVC.password = self.passwordTextField.text!
                        
                    self.navigationController?.pushViewController(loadingVC, animated: true)
                    
                }
                
            }
        
        }
        
        else {
            
            errorLabel.text = "Mission failed: Please fill in all fields before launching! - Houston"
            errorLabel.alpha = 1
            
        }
        
    }

}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        pushLoadingVC() 
        
        return true
        
    }
    
}
