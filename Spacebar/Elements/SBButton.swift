//
//  SBButton.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit

class SBButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(Text: String, Color: UIColor){
        super.init(frame: .zero)
        
        self.setTitle(Text, for: .normal)
        self.backgroundColor = Color
        
        configure()
        
    }
    
    
    private func configure(){
        
        layer.cornerRadius      = 10
        titleLabel?.font        = UIFont.preferredFont(forTextStyle: .headline)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    
    

}
