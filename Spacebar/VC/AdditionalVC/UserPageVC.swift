//
//  UserPageVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/29/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: "User-Page" - What a user sees every time they select another user

import UIKit

class UserPageVC: UIViewController {
    
    let userLogin = UILabel()
    let userBio = UILabel()
    let userAvatar = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        
        configureUserLabel()
        configureUserBio()
        configureUserAvatar()
        configureSegmentedController()
        
    }
    
    func configureUserLabel(){
        
        
        
        
        
    }
    
    func configureUserBio(){
        
        
        
        
        
    }
    
    func configureUserAvatar(){
        
        view.addSubview(userAvatar)
        
        userAvatar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            userAvatar.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            userAvatar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userAvatar.heightAnchor.constraint(equalToConstant: 500),
            userAvatar.widthAnchor.constraint(equalToConstant: 500)
            
        ])

        
        
        
    }
    
    func configureSegmentedController(){
        
        let media = ["Messages/Photos", "Clips", "Videos", "Interactions"]
        let segmentedControl = UISegmentedControl(items: media)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(mediaSelection(segmentedControl:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        
        view.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            segmentedControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75)
            
        ])
        
        
    }
    
    @objc func mediaSelection(segmentedControl: UISegmentedControl){
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            userAvatar.image = UIImage(named: "Heartbreak")
        case 1:
            userAvatar.image = UIImage(named: "ElonMusk")
        case 2:
            userAvatar.image = UIImage(named: "Moon")
        default:
            userAvatar.image = UIImage(named: "Spacebar")
        }
        
        
    }


}
