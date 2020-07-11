//
//  NewConvoSearchVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 7/1/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit

class NewConvoSearchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureNavBar()
        
    }
    
    func configureNavBar(){
        
        let searchTextField = UISearchBar()
        
        searchTextField.sizeToFit()
        searchTextField.placeholder = "Not available in Beta"
        // searchTextField.delegate = self - set the delegate
        navigationItem.hidesBackButton = true
        navigationItem.titleView = searchTextField
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(popNewConvoSearchVC))
        
    }
    
    @objc func popNewConvoSearchVC(){
        
        navigationController?.popViewController(animated: true)
        
    }
    
}
