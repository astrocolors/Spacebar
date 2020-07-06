//
//  AddPhotoVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 7/2/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: This is the screen that pops up every time you want to post a photo

import UIKit

class AddPhotoVC: UIViewController {
    
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        
        configureNavBar()
        configureImageView()
        configurePhotoLibrary()
        
    }
    
    func configureNavBar(){
        
        let nextButton = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(pushEditPhotoVC))
        
        navigationController?.navigationItem.setRightBarButton(nextButton, animated: true)
        
    }
    
    func configureImageView(){
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage(named: "Spacebar")
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 80)
            
        ])

        
        
    }
    
    func configurePhotoLibrary(){
        
        
        
        
        
    }
    
    @objc func pushEditPhotoVC(){
        
        let editPhotoVC = EditPhotoVC()
        
        navigationController?.pushViewController(editPhotoVC, animated: true)
        
    }

}
