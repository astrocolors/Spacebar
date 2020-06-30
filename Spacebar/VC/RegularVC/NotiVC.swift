//
//  NotiVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: To display user notifications

import UIKit

class NotiVC: UIViewController {
    
    var notificationTable = UITableView()
    
    var delegate: ViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.1137254902, blue: 0.2784313725, alpha: 1)
        
        configureNavBar()
        configureTableView()

    }
    
    func configureNavBar(){
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsOnSwipe = true
        
        let sideMenuItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(pushSideMenuVC))
        
        let DMItem = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(pushDMVC))
        
        navigationItem.setLeftBarButton(sideMenuItem, animated: true)
        navigationItem.setRightBarButton(DMItem, animated: true)
        
    }
    
    func configureTableView(){
        
        view.addSubview(notificationTable)
        
        notificationTable.translatesAutoresizingMaskIntoConstraints = false
        
        notificationTable.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        
        NSLayoutConstraint.activate([
            
            notificationTable.topAnchor.constraint(equalTo: view.topAnchor),
            notificationTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            notificationTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            notificationTable.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
        
        
    }
    
    @objc func pushSideMenuVC(){
        
        delegate?.sideMenuToggle()
        
    }
    
    @objc func pushDMVC(){
        
        let dmVC = DMVC()
        
        navigationController?.pushViewController(dmVC, animated: true)
        
    }

}
