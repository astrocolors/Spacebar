//
//  SBLikeAnimation.swift
//  Spacebar
//
//  Created by Shamik Patro on 7/8/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit

class likeAnimation{
    
    var container           = UIView()
    var layoutConstraint    = NSLayoutConstraint()
    
    init(container: UIView, layoutConstraint: NSLayoutConstraint) {
        
        self.container = container
        self.layoutConstraint = layoutConstraint
        
    }
    
    func animate(completion: @escaping () -> Void) {
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveEaseInOut, animations: { [weak self] in
            
            self?.container.layoutIfNeeded()
            
        }){ [weak self] (_) in
            
            self?.layoutConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3) {
                
                self?.container.layoutIfNeeded()
                completion()
                
            }
            
        }
    
    }
    
}
