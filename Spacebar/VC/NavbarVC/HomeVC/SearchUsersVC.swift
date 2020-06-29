//
//  SearchUsersVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: This is the screen that pops up every time you want to search for a user

import UIKit

class SearchUsersVC: UIViewController {
    
    enum Section {
        
        case Main
        
    }
    
    var username: String!
    var searchUsers: [SearchUser]! = []
    var UserTableView = UITableView()
    var dataSource: UITableViewDiffableDataSource<Section, SearchUser>!
    
    let searchTextField = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureNavigationBar()
        configureTableView()
        configureDataSource()
    }
    
    
    func configure(){
        
        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        
    }
    
    func configureNavigationBar(){
        
        searchTextField.sizeToFit()
        searchTextField.placeholder = "@Username"
        searchTextField.delegate = self
        navigationItem.hidesBackButton = true
        navigationItem.titleView = searchTextField
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(popSearchVC))
        
        
    }
    
    func configureTableView(){
        
        view.addSubview(UserTableView)
        
        UserTableView.rowHeight = 60
        UserTableView.separatorStyle = .none
        UserTableView.separatorInset = .zero
        UserTableView.delegate = self
        UserTableView.dataSource = self
        UserTableView.register(SearchUsersCell.self, forCellReuseIdentifier: SearchUsersCell.reuseID)
        
        UserTableView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        
        UserTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            UserTableView.topAnchor.constraint(equalTo: view.topAnchor),
            UserTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            UserTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            UserTableView.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
        
    }
    
    func getSearchUsers(){
        
        NetworkManager.shared.getSearchUsers(for: username, page: 1) { [weak self] (SearchUsers, errorMessage) in
            
            guard let self = self else { return }
            
            guard SearchUsers != nil else {
                
             print("Network Failure")
                
                return
            }
            
            self.searchUsers = SearchUsers
            
            self.updateData()
            
            
        }
        
    }
    
    func configureDataSource(){
        
        dataSource = UITableViewDiffableDataSource<Section, SearchUser>(tableView: UserTableView, cellProvider: { (tableview, indexpath, searchUser) -> UITableViewCell? in
            
            let cell = self.UserTableView.dequeueReusableCell(withIdentifier: SearchUsersCell.reuseID, for: indexpath) as! SearchUsersCell
            
            cell.set(searchUser: searchUser)
            
            return cell
            
        })
        
        
    }
    
    func updateData(){
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, SearchUser>()
        snapshot.appendSections([.Main])
        snapshot.appendItems(searchUsers)
        
        DispatchQueue.main.async {
            
            self.dataSource.apply(snapshot, animatingDifferences: true)
            
        }
        
    }
    
    @objc func popSearchVC(){
        
        navigationController?.popViewController(animated: true)
        
    }
    

}

extension SearchUsersVC: UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return [searchUsers].count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchUsersCell.reuseID, for: indexPath) as! SearchUsersCell
        
        cell.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        
        return cell
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        username = searchBar.text!
        
        getSearchUsers()
        
    }
    
}

