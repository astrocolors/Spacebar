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
    var segmentedController = UISegmentedControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        configureSegmentedController()
        configureNavBar()
        
    }
    
    func configureNavBar(){
        
        //navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.07450980392, green: 0.1137254902, blue: 0.3529411765, alpha: 1)
        
        let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(pushSearchVideosVC))
        let sideMenuItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(pushSideMenuVC))
        
        navigationItem.setRightBarButton(searchItem, animated: true)
        navigationItem.setLeftBarButton(sideMenuItem, animated: true)
        
    }
    
    func configureSegmentedController(){
        
        let mediaType = ["Videos", "Live"]
        
        segmentedController = UISegmentedControl(items: mediaType)
        segmentedController.translatesAutoresizingMaskIntoConstraints = false
        segmentedController.selectedSegmentIndex = 0
        
        view.addSubview(segmentedController)
        
        
        NSLayoutConstraint.activate([
            
            segmentedController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedController.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedController.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            segmentedController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
            
        ])

    }
    
    @objc func pushSideMenuVC(){
        
        delegate?.sideMenuToggle()
        
    }
    
    @objc func pushSearchVideosVC(){
        
        let searchVideosVC = SearchVideosVC()
        
        navigationController?.pushViewController(searchVideosVC, animated: true)
        
    }
    
    
}
