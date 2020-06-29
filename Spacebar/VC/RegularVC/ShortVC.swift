//
//  ShortVC.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: Scrollable short videos

import UIKit

class ShortVC: UIViewController {
    
    var delegate: ViewControllerDelegate?
    var ImagePicker: UIImagePickerController!
    var alert: UIAlertController!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.1137254902, blue: 0.2784313725, alpha: 1)
        
        configureNavBar()
        
    }
    
    func configureNavBar(){
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushAddShortVC))
        let sideMenuItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(pushSideMenuVC))
        
        navigationItem.setRightBarButton(addItem, animated: true)
        navigationItem.setLeftBarButton(sideMenuItem, animated: true)
        
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
    
    @objc func pushAddShortVC(){
        
        let addShortVC = AddShortVC()
        
        showImagePickerController()
        
        //navigationController?.pushViewController(addShortVC, animated: true)
        
    }

}
