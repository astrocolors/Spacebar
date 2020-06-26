//
//  SBTextField.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/24/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit

class SBTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(Text: String, ReturnType: UIReturnKeyType, KeyboardType: UIKeyboardType){
        super.init(frame: .zero)
        
        self.returnKeyType = ReturnType
        self.keyboardType = KeyboardType
        self.placeholder = Text
        
        configure()
        
    }
    
    private func configure(){
        
           translatesAutoresizingMaskIntoConstraints = false
           
           layer.cornerRadius          = 20
           layer.borderWidth           = 1
           layer.borderColor           = UIColor.white.cgColor
           
           textColor                   = .white
           tintColor                   = .white
           textAlignment               = .center
           font                        = UIFont.preferredFont(forTextStyle: .body)
           adjustsFontSizeToFitWidth   = true
           minimumFontSize             = 8
           
           backgroundColor             = .clear
           autocorrectionType          = .no
        
    }

}
