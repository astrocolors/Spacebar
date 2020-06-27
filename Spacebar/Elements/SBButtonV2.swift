//
//  SBButtonV2.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: Custom Purple Button

import UIKit

class SBButtonV2: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(Text: String, Color: UIColor, CornerRadius: CGFloat){
        super.init(frame: .zero)
        
        self.layer.cornerRadius = CornerRadius
        self.setTitle(Text, for: .normal)
        self.backgroundColor = Color
        
        configure()
        
    }
    
    private func configure(){
        
        titleLabel?.textColor   = .white
        titleLabel?.font        = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
