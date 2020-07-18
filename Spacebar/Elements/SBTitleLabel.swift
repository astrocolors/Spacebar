//
//  SBTitleLabel.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: Custom Title Label

import UIKit

class SBTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(TextAlignment: NSTextAlignment, FontSize: CGFloat) {
        super.init(frame: .zero)
        
        self.textAlignment = TextAlignment
        self.font = UIFont.systemFont(ofSize: FontSize, weight: .bold)
        
        configure()
        
    }
    
    private func configure(){
        
        textColor                                   = .label
        adjustsFontSizeToFitWidth                   = true
        minimumScaleFactor                          = 0.9
        lineBreakMode                               = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints   = false
    }
    
}
