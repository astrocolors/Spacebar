//
//  DMVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: View controller seen every time a user wants to see their DM's

import UIKit

class DMVC: UIViewController {
    
    var DMTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        configureTableView()
    }
    
    func configureNavBar(){
        
        let searchBar = UISearchBar()
        let newConverstionItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(pushNewConvoSearchVC))
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        navigationItem.titleView = searchBar
        navigationItem.setRightBarButton(newConverstionItem, animated: true)
        
    }
    
    func configureTableView(){
        
        view.addSubview(DMTableView)
        
        DMTableView.rowHeight                       = 80
        DMTableView.separatorStyle                  = .singleLine
        DMTableView.separatorInset                  = .zero
        DMTableView.delegate                        = self
        DMTableView.dataSource                      = self
        DMTableView.register(DMUserCells.self, forCellReuseIdentifier: DMUserCells.reuseID)
        
        DMTableView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        
        DMTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            DMTableView.topAnchor.constraint(equalTo: view.topAnchor),
            DMTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            DMTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            DMTableView.heightAnchor.constraint(equalTo: view.heightAnchor)

        ])
        
    }
    
    @objc func pushNewConvoSearchVC(){
        
        let newConvoSearchVC = NewConvoSearchVC()
        
        navigationController?.pushViewController(newConvoSearchVC, animated: true)
        
    }
    
}

extension DMVC: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 40
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DMUserCells.reuseID, for: indexPath) as! DMUserCells
        
        cell.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        
        return cell
        
    }
    
}
