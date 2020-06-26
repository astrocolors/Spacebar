//
//  SBAvatarImageView.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit

class SBAvatarImageView: UIImageView {
    
    let placeholderImage  = UIImage(named: "Spacebar")

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
        layer.cornerRadius                        = frame.height/2
        layer.masksToBounds                       = false
        clipsToBounds                             = true
        image                                     = placeholderImage! // force unless downloading
        
        
    }
    
    func downloadImage(from URLString: String){
        
        let image = UIImage(named: "Spacebar")
        
        DispatchQueue.main.async {
            self.image = image
        }
        
        self.image = image
        
    }
    
}
