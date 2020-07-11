//
//  ShortVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: Scrollable short videos

import UIKit
import AVKit
import AVFoundation

class ShortVC: UIViewController {
    
    let heartView = UIImageView()
    let tableView = UITableView()
    let refreshControl = UIRefreshControl()
    
    var delegate: ViewControllerDelegate?
    var ImagePicker: UIImagePickerController!
    var alert: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
        configureNavBar()
        configureTableView()
        configureRefreshView()
        //configurePlayer()
        //configureHeart()
        //setupTapRecognizer()
        //setupSwipeRecognizer()
        
    }
    
    func configureNavBar(){
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushAddShortVC))
        let sideMenuItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(pushSideMenuVC))
        
        navigationItem.setRightBarButton(addItem, animated: true)
        navigationItem.setLeftBarButton(sideMenuItem, animated: true)
        
    }
    
    func configureTableView(){
        
        view.addSubview(tableView)
        
        tableView.delegate                                  = self
        tableView.dataSource                                = self
        tableView.isPagingEnabled                           = true
        tableView.showsVerticalScrollIndicator              = false
        tableView.contentInsetAdjustmentBehavior            = .never
        tableView.register(ShortCell.self, forCellReuseIdentifier: ShortCell.reuseID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])

    }
    
    func configureRefreshView(){
        
        tableView.addSubview(refreshControl)
        
        refreshControl.addTarget(self, action: #selector(refreshClips), for: .touchUpInside)
        
    }
    
    func configurePlayer(){
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video", ofType: "mp4")!))
        let layer = AVPlayerLayer(player: player)
        
        layer.frame = view.bounds
        layer.videoGravity = .resizeAspectFill
        
        view.layer.addSublayer(layer)
        
        player.play()
        
    }
    
    func setupTapRecognizer(){
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
        
    }
    
    func configureHeart(){
        
        view.addSubview(heartView)
        
        heartView.translatesAutoresizingMaskIntoConstraints = false
        heartView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            
            heartView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heartView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            heartView.heightAnchor.constraint(equalToConstant: 100),
            heartView.widthAnchor.constraint(equalToConstant: 100)
            
        ])
        
    }
    
    func showImagePickerController(){
        
        let imagePicker = UIImagePickerController()
        let alert = UIAlertController(title: "Choose your video", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Choose from Library", style: .default, handler: { (action) in
            imagePicker.sourceType = .photoLibrary
        }))
        alert.addAction(UIAlertAction(title: "Take from Camera", style: .default, handler: { (action) in
            imagePicker.sourceType = .camera
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
        
    }
    
    @objc func pushSideMenuVC(){
        
        delegate?.sideMenuToggle()
        
    }
    
    @objc func doubleTap(){
        
        
        
        
    }
    
    @objc func refreshClips(){
        
        self.refreshControl.endRefreshing()
        
    }
    
    @objc func pushAddShortVC(){
        
        let addShortVC = AddShortVC()
        
        showImagePickerController()
        
        //navigationController?.pushViewController(addShortVC, animated: true)
        
    }

}

extension ShortVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShortCell") as! ShortCell
        
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return self.tableView.frame.size.height;
        
    }
    
}
