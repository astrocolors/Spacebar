//
//  Utilities.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: Mainly text and field validation - with some extras thrown in

import UIKit

struct Utilities {
    
    static func isTextFieldValid(TextField: UITextField) -> Bool {
        
        if (TextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""){
            
            return false
            
        }
        
        else {
        
        return true
            
        }
        
    }
    
    static func isPasswordValid(Password: String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")

        return passwordTest.evaluate(with: Password)
        
    }
    
    static func configureCollectionViewFlowLayout(view: UIView) -> UICollectionViewFlowLayout{
        
        let width                           = view.bounds.width
        let height: CGFloat                 = view.bounds.height / 20
        
        let flowLayout                      = UICollectionViewFlowLayout()
        
        flowLayout.estimatedItemSize        = .zero
        flowLayout.itemSize                 = CGSize(width: width, height: height)
        flowLayout.invalidateLayout()

        
        return flowLayout
        
    }
    
    
}
