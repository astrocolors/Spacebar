//
//  SignUpV1VC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
// Purpose: Allow users to enter first name and last name

import UIKit

class SignUpV1VC: UIViewController {
    
    let FirstNameTextField = SBTextField(Text: "First Name", ReturnType: .continue, KeyboardType: .default)
    let LastNameTextField = SBTextField(Text: "Last Name", ReturnType: .next, KeyboardType: .default)
    let nextButton = SBButton(Text: "Next", Color: #colorLiteral(red: 0.1960784314, green: 0.7215686275, blue: 0.3176470588, alpha: 1))
    let errorLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.1137254902, blue: 0.2784313725, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configureFirstNameTextField()
        configureLastNameTextField()
        configureNextButton()
        configureErrorLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // add custom animation here
        
    }
    

    func configureFirstNameTextField(){
        
        
        view.addSubview(FirstNameTextField)
        
        NSLayoutConstraint.activate([
        
            FirstNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            FirstNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            FirstNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            FirstNameTextField.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
    }
    
    func configureLastNameTextField(){
        
        view.addSubview(LastNameTextField)
        
        NSLayoutConstraint.activate([
        
            LastNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180),
            LastNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            LastNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            LastNameTextField.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
    }
    
    func configureNextButton(){
        
        view.addSubview(nextButton)
        
        nextButton.addTarget(self, action: #selector(pushSignUpV2VC), for: .touchUpInside)
        
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
    
    @objc func pushSignUpV2VC(){
        
        let signUpV2VC = SignUpV2VC()
        
        if (Utilities.isTextFieldValid(TextField: FirstNameTextField) == true && Utilities.isTextFieldValid(TextField: LastNameTextField) == true){
            
            signUpV2VC.firstname       = FirstNameTextField.text!
            signUpV2VC.lastname        = LastNameTextField.text!
            
            navigationController?.pushViewController(signUpV2VC, animated: true)
            
        }
        
        else {
            
            errorLabel.text = "Mission failed: Please fill in all fields before launching! - Houston"
            errorLabel.alpha = 1
            
        }
        
    }
}
