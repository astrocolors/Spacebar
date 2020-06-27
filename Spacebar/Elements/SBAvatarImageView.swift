//
//  SBAvatarImageView.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: Custom Avatar Image View

import UIKit

class SBAvatarImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "Spacebar")!// Change this to a better placeholder image

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius                        = frame.size.height / 2
        layer.masksToBounds                       = false
        clipsToBounds                             = true
        contentMode                               = UIView.ContentMode.scaleAspectFill
        image                                     = placeholderImage
        
        
    }
    
    func downloadImage(from URLString: String){
        
        guard let url = URL(string: URLString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            
            guard let self = self else { return }
            
            if error != nil { return }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                
                self.image = image
                
            }
            
            
        }
        
        task.resume()
        
    }
    
}
