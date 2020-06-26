//
//  HomeVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: Scrollable short messages and pictures

import UIKit

class HomeVC: UIViewController {
    
    enum Section{
        
        case Main
        
    }
    
    var collectionView: UICollectionView!
    
    var followers: [Follower] = []
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    let loginButton = SBButtonV2(Text: "Login", Color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), CornerRadius: 0)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.1137254902, blue: 0.2784313725, alpha: 1)
        
        configureNavBar()
        configureLoginButton()
        //configureCollectionView()
        //getFollowers()
        //configureDataSource()
        
    }
    
    func configureNavBar(){
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let messageItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(pushAddMessageVC))
        let sideMenuItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(pushSideMenuVC))
        
        navigationItem.setRightBarButton(messageItem, animated: true)
        navigationItem.setLeftBarButton(sideMenuItem, animated: true)
        
    }
    
    func configureLoginButton(){
        
        view.addSubview(loginButton)
        
        loginButton.addTarget(self, action: #selector(pushInitialScreen), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            loginButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
    }
    
    func configureCollectionView(){
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: configureCollectionLayout())
        
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .orange
        
        collectionView.register(MessagesCell.self, forCellWithReuseIdentifier: MessagesCell.reuseID)
        
        
    }
    
    func configureCollectionLayout() -> UICollectionViewFlowLayout{
        
        let width               = view.bounds.width
        let flowLayout          = UICollectionViewFlowLayout()
        
        flowLayout.itemSize     = CGSize(width: width, height: 20)
        
        return flowLayout
    }
    
    func getFollowers(){
        
        
        
        
        
    }
    
    func configureDataSource(){
        
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, IndexPath, follower) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MessagesCell.reuseID, for: IndexPath) as! MessagesCell
            
            cell.backgroundColor = .blue
            
            cell.set(follower: follower)
            
            return cell
            
        })
    }
    
    func updateData(){
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.Main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
        
        dataSource.apply(snapshot, animatingDifferences: true)

        
    }
    
    @objc func pushSideMenuVC(){
        
        let sideMenuVC = SideMenuVC()
        
        navigationController?.pushViewController(sideMenuVC, animated: true)
    }
    
    @objc func pushAddMessageVC(){
        
        let addMessageVC = AddMessageVC()
        
        navigationController?.pushViewController(addMessageVC, animated: true)
        
    }
    
    @objc func pushInitialScreen(){
        
        let initialScreen = UINavigationController(rootViewController: InitialScreen())
        
        initialScreen.modalPresentationStyle = .fullScreen
        
        present(initialScreen, animated: true)
        
    }
    
}