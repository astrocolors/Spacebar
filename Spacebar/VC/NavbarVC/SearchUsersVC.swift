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
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, SearchUser>!
    
    let searchTextField = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureNavigationBar()
        configureCollectionView()
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
    
    func configureCollectionView(){
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: Utilities.configureCollectionViewFlowLayout(view: view))
        
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = #colorLiteral(red: 0.0431372549, green: 0.6862745098, blue: 0.7450980392, alpha: 1)
        
        collectionView.register(SearchUsersCell.self, forCellWithReuseIdentifier: SearchUsersCell.reuseID)

        
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
        
        dataSource = UICollectionViewDiffableDataSource<Section, SearchUser>(collectionView: collectionView, cellProvider: { (collectionview, indexpath, searchUser) -> UICollectionViewCell? in
            
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: SearchUsersCell.reuseID, for: indexpath) as! SearchUsersCell
            
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

extension SearchUsersVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        username = searchBar.text!
        
        getSearchUsers()
        
    }
    
}
