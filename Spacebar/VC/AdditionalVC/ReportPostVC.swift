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
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        configureLabel()
        configureTextView()
    }
    
    func configureLabel(){
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Please explain why you find this post is offensive:"
        
        label.adjustsFontSizeToFitWidth = true
        
        
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            label.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        
    }
    
    func configureTextView(){
        
        view.addSubview(textView)
        textView.placeholder = "What went wrong?"
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.heightAnchor.constraint(equalToConstant: 100)
            
        ])
        
    }
    
    


}
