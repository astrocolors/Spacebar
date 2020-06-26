//
//  Utilities.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Utilities: Mainly textfield & password validation

import Foundation
import UIKit

class Utilities {
    
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
    
    
}
