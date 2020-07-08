//
//  AdditionalNM.swift
//  Spacebar
//
//  Created by Shamik Patro on 7/2/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: Additional network managers that aren't directly related to the home screens. 

import UIKit
import Firebase
import FirebaseStorage

class AddNM{
    
    static let shared = AddNM()
    
    let baseURL = "gs://spacebar-21236.appspot.com/Users"
    
    func getMenuFollowers(){
        
        
        
        
    }
    
    func getSearchUsers(){
        
        let folderURL = baseURL
        
        let storageRef = Storage.storage().reference().child(folderURL)
        
        print(storageRef)
        
        storageRef.listAll { (results, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
                
            }
            
            for item in results.items {
                
                print(item)
                
            }
            
        }
        
        
        
        
        
    }
    
    func getSearchVideos(){
        
        
        
        
    }
    
    func getDM(){
        
        
        
        
        
    }
    
    func sendDM(){
        
        
     
        
        
    }
    
    func updateProfile(){
        
        
        
        
        
    }
    
}
