//
//  SearchVideosVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/26/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit

class SearchVideosVC: UIViewController {
    
    let searchVideosTextField = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        configureNavBar()
    }
    
    private func configure(){
        
        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        
    }
    
    private func configureNavBar(){
        
        let popSearchVC = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(PopSearchVC))
        
        searchVideosTextField.placeholder = "Search Videos"
        
        navigationItem.hidesBackButton = true
        navigationItem.titleView = searchVideosTextField
        navigationItem.rightBarButtonItem = popSearchVC
        
        
    }
    
    @objc func PopSearchVC(){
        
        navigationController?.popViewController(animated: true)
        
    }

}
