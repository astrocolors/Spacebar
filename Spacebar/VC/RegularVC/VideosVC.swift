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
    var segmentedController = UISegmentedControl()
    var tableView = UITableView()
    var refreshController = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureNavBar()
        configureSegmentedController()
        configureTableView()
        configureRefreshController()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Deselects the selected tableview cell ~smoothly~
        
        let selectedRow: IndexPath? = tableView.indexPathForSelectedRow
        if let selectedRowNotNill = selectedRow {
            tableView.deselectRow(at: selectedRowNotNill, animated: true)
            
        }
        
    }
    
    func configureNavBar(){
        
        let image: UIImage = UIImage(named: "Astronaut")!
        let logo = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        logo.contentMode = .scaleAspectFit
        logo.image = image
        
        navigationController?.navigationBar.barTintColor = .systemBackground
        
        let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(pushSearchVideosVC))
        let sideMenuItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(pushSideMenuVC))
        
        navigationItem.setRightBarButton(searchItem, animated: true)
        navigationItem.setLeftBarButton(sideMenuItem, animated: true)
        //navigationItem.titleView = logo
        
    }
    
    func configureSegmentedController(){
        
        let mediaType = ["Videos", "Live"]
        
        segmentedController = UISegmentedControl(items: mediaType)
        segmentedController.translatesAutoresizingMaskIntoConstraints = false
        segmentedController.selectedSegmentIndex = 0
        
        view.addSubview(segmentedController)
        
        
        NSLayoutConstraint.activate([
            
            segmentedController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedController.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedController.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            segmentedController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
            
        ])

    }
    
    func configureTableView(){
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInset                            = .zero
        tableView.register(VideosCell.self, forCellReuseIdentifier: VideosCell.reuseID)
        tableView.rowHeight                                 = 400
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: segmentedController.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
    }
    
    func configureRefreshController(){
        
        tableView.addSubview(refreshController)
        
        refreshController.addTarget(self, action: #selector(refreshVideos), for: .valueChanged)
        
        
    }
    
    @objc func pushSideMenuVC(){
        
        delegate?.sideMenuToggle()
        
    }
    
    @objc func pushSearchVideosVC(){
        
        let searchVideosVC = SearchVideosVC()
        
        navigationController?.pushViewController(searchVideosVC, animated: true)
        
    }
    
    @objc func refreshVideos(){
        
        print("Videos Refreshed")
        
        refreshController.endRefreshing()
        
    }
}

extension VideosVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideosCell") as! VideosCell
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let videoPlayerVC = VideoPlayerVC()
        
        videoPlayerVC.modalPresentationStyle = .fullScreen
        
        present(videoPlayerVC, animated: true)
        
    }
    
}
