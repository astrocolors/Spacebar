//
//  ReportPostVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 7/3/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit
import KMPlaceholderTextView

class ReportPostVC: UIViewController {
    
    let label = UILabel()
    let textView = KMPlaceholderTextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        textView.delegate = self
        
        configureLabel()
        configureTextView()
    }
    
    func configureLabel(){
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Please explain why you find this post offensive:"
        
        label.adjustsFontSizeToFitWidth = true
        
        
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            label.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        
    }
    
    func configureTextView(){
        
        view.addSubview(textView)
        textView.placeholder = "What went wrong? - Times New Roman needs to be changed"
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        textView.returnKeyType = .send
        
        textView.font = UIFont(name: "Times New Roman", size: 20)
        
        NSLayoutConstraint.activate([
            
            textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: -2),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.heightAnchor.constraint(equalToConstant: 100)
            
        ])
        
    }
    
    @objc func sendReport(){
        
        HomeNM.shared.reportPost()
        
        navigationController?.popViewController(animated: true)
        
    }
    
}

extension ReportPostVC: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            sendReport()
        }
        
        return true
        
    }
    
}
