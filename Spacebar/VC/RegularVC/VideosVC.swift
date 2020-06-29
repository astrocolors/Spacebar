//
//  VideosVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: Scrollable regular videos

import UIKit
import Firebase
import FirebaseStorage

class VideosVC: UIViewController {
    
    var delegate: ViewControllerDelegate?
    var listButton = SBButtonV2(Text: "Checking", Color: #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1), CornerRadius: 10) // temporary
    var pictures: [Data?]! = [] // temporary
    var pictureImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.1137254902, blue: 0.2784313725, alpha: 1)
        
        configureNavBar()
        configureListButton() // Temporary
        configureImageView()
        
    }
    
    func configureNavBar(){
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(pushSearchVideosVC))
        let sideMenuItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(pushSideMenuVC))
        
        navigationItem.setRightBarButton(searchItem, animated: true)
        navigationItem.setLeftBarButton(sideMenuItem, animated: true)
        
    }
    
    func configureListButton(){
        
        // Temporary
        
        view.addSubview(listButton)
        
        listButton.addTarget(self, action: #selector(ListThings), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            listButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 520),
            listButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            listButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            listButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
    }
    
    
    func configureImageView(){
        
        view.addSubview(pictureImageView)
        
        pictureImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            pictureImageView.topAnchor.constraint(equalTo: view.topAnchor),
            pictureImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pictureImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pictureImageView.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
        
        
    }
    
    @objc func ListThings(){
        
        NetworkManager.shared.getUserSpecificPhotos(for: (Auth.auth().currentUser?.email)!) { (pictures, errorMessage) in
            
            guard pictures != nil else {
                
                print("Network failure")
                
                return
                
            }
            
            self.pictures = pictures
            
            let imageData = pictures[0]
            
            self.pictureImageView.image = UIImage(data: imageData!)
            
            
        }
        
        
        
    }
    
    @objc func pushSideMenuVC(){
        
        delegate?.sideMenuToggle()
        
    }
    
    @objc func pushSearchVideosVC(){
        
        let searchVideosVC = SearchVideosVC()
        
        navigationController?.pushViewController(searchVideosVC, animated: true)
        
    }
    
    
}
