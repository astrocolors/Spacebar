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
    var segmentedController = UISegmentedControl()
    
    var delegate: ViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        configureSegmentedController()
        configureTableView()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        configureNavBar()
    }
    
    func configureNavBar(){
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.07450980392, green: 0.1137254902, blue: 0.3529411765, alpha: 1)
        navigationController?.hidesBarsOnSwipe = true
        
        let sideMenuItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(pushSideMenuVC))
        
        let DMItem = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(pushDMVC))
        
        navigationItem.setLeftBarButton(sideMenuItem, animated: true)
        navigationItem.setRightBarButton(DMItem, animated: true)
        
    }
    
    func configureTableView(){
        
        view.addSubview(notificationTable)
        
        notificationTable.translatesAutoresizingMaskIntoConstraints = false
        notificationTable.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        notificationTable.separatorInset = .zero
        notificationTable.rowHeight = 60
        
        NSLayoutConstraint.activate([
            
            notificationTable.topAnchor.constraint(equalTo: segmentedController.bottomAnchor),
            notificationTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            notificationTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            notificationTable.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
    }
    
    func configureSegmentedController(){

        
        let mediaType = ["", "", ""]
        
        segmentedController = UISegmentedControl(items: mediaType)
        
        segmentedController.setImage(UIImage(systemName: "text.bubble.fill"), forSegmentAt: 0)
        segmentedController.setImage(UIImage(systemName: "film.fill"), forSegmentAt: 1)
        segmentedController.setImage(UIImage(systemName: "play.rectangle.fill"), forSegmentAt: 2)
 
        segmentedController.selectedSegmentIndex = 0
        segmentedController.translatesAutoresizingMaskIntoConstraints = false
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
    
    @objc func pushDMVC(){
        
        let dmVC = DMVC()
        
        navigationController?.pushViewController(dmVC, animated: true)
        
    }

}
