//
//  UserProfileNM.swift
//  Spacebar
//
//  Created by Shamik Patro on 7/2/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: Network manager for users (current one and others)

import UIKit
import Firebase
import FirebaseStorage

class ProfileNM{
    
    static let shared = ProfileNM()
    let baseURL = "gs://spacebar-21236.appspot.com/Users/"
    let user = Auth.auth().currentUser?.email
    let userName = Auth.auth().currentUser?.displayName
    
    func getMessages(){
        
        let storageRef = Storage.storage().reference(withPath: "Users/\(user!)/Messages")
        
        storageRef.listAll { (result, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
                
            }
            
            for item in result.items {
                
                print(item)
                
            }
            
        }
        
    }
    
    func getPhotos(){
        
        let storageRef = Storage.storage().reference(withPath: "Users/\(user!)/Photos")
        
        storageRef.listAll { (result, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
                
            }
            
            for item in result.items {
                
                print(item)
                
            }
            
        }
        
    }
    
    func getClips(){
        
        
        
    
    }
    
    func getVideos(){
        
        
        
        
    }
    
    func getInteractions(){
        
        
        
        
        
    }
    
    
    
}
