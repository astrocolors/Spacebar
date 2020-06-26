//
//  SBAvatarImageView.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit

class SBAvatarImageView: UIImageView {
    
    let placeholderImage  = UIImage(named: "Spacebar")! // Change this to a better placeholder image

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth                         = 2
        layer.borderColor                         = UIColor.black.cgColor
        layer.cornerRadius                        = 10 // Change this to a circle
        layer.masksToBounds                       = false
        clipsToBounds                             = true
        image                                     = placeholderImage
        
        
    }
    
    func downloadImage(from URLString: String){
        
        let image = UIImage(named: "Spacebar")
        
        DispatchQueue.main.async {
            self.image = image
        }
        
        self.image = image
        
    }
    
}
