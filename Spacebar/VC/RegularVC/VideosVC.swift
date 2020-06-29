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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.1137254902, blue: 0.2784313725, alpha: 1)
        
        configureNavBar()
        
    }
    
    func configureNavBar(){
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(pushSearchVideosVC))
        let sideMenuItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(pushSideMenuVC))
        
        navigationItem.setRightBarButton(searchItem, animated: true)
        navigationItem.setLeftBarButton(sideMenuItem, animated: true)
        
    }
    
    @objc func pushSideMenuVC(){
        
        delegate?.sideMenuToggle()
        
    }
    
    @objc func pushSearchVideosVC(){
        
        let searchVideosVC = SearchVideosVC()
        
        navigationController?.pushViewController(searchVideosVC, animated: true)
        
    }
    
    
}
