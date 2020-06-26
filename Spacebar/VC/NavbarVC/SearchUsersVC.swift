//
//  SearchUsersVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit

class SearchUsersVC: UIViewController {
    
    var username: String?
    
    let searchTextField = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureNavigationBar()
    }
    
    
    func configure(){
        
        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        
        
    }
    
    func configureNavigationBar(){
        
        searchTextField.sizeToFit()
        searchTextField.placeholder = "@Username"
        navigationItem.hidesBackButton = true
        navigationItem.titleView = searchTextField
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(popSearchVC))
        
        
    }
    
    @objc func popSearchVC(){
        
        navigationController?.popViewController(animated: true)
        
    }
    

}
