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
    
    var delegate: ViewControllerDelegate?
    var ImagePicker: UIImagePickerController!
    var alert: UIAlertController!

    let newView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
        configureNavBar()
        configurePlayer()
        setupSwipeRecognizer()
        configureNewView()
        
    }
    
    func configureNavBar(){
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushAddShortVC))
        let sideMenuItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(pushSideMenuVC))
        
        navigationItem.setRightBarButton(addItem, animated: true)
        navigationItem.setLeftBarButton(sideMenuItem, animated: true)
        
    }
    
    func configurePlayer(){
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video", ofType: "mp4")!))
        let layer = AVPlayerLayer(player: player)

        
        layer.frame = view.bounds
        layer.videoGravity = .resizeAspectFill
        
        view.layer.addSublayer(layer)
        
        
        player.play()
        
    }
    
    func setupSwipeRecognizer(){
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture(sender:)))
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture(sender:)))
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture(sender:)))
        
        swipeUp.direction = .up
        swipeDown.direction = .down
        swipeLeft.direction = .left
        
        view.addGestureRecognizer(swipeUp)
        view.addGestureRecognizer(swipeDown)
        view.addGestureRecognizer(swipeLeft)
        
        
    }
    
    func configureNewView(){
        
        view.addSubview(newView)
        
        newView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        NSLayoutConstraint.activate([
            
            newView.topAnchor.constraint(equalTo: view.topAnchor),
            newView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newView.heightAnchor.constraint(equalTo: view.heightAnchor)
            
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
    
    @objc func swipeGesture(sender: UISwipeGestureRecognizer?) {
        
        if let swipeGesture = sender {
            
            switch swipeGesture.direction {
                
            case .up:
                
                UIView.animate(withDuration: 0.3) {
                    
                    self.view.center.y -= 900
                    
                    self.newView.center.y += 900
                    
                }
                
            case .down:
                
                UIView.animate(withDuration: 0.3) {
                    
                    self.view.center.y += 900
                    
                }
                
            case .left:
                
                UIView.animate(withDuration: 0.2) {
                    
                    self.view.center.x -= 300
                    
                }
                
            default:
                
                break
                
            }
        
        }
        
    }
    
    @objc func pushAddShortVC(){
        
        let addShortVC = AddShortVC()
        
        showImagePickerController()
        
        //navigationController?.pushViewController(addShortVC, animated: true)
        
    }

}
