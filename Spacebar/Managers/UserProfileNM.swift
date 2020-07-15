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

class ProfileNM {
    
    static let shared = ProfileNM()
    let baseURL = "gs://spacebar-21236.appspot.com/Users/"
    let user = Auth.auth().currentUser?.email
    let userName = Auth.auth().currentUser?.displayName
    
    func getMessages(completed: @escaping([Data]) -> Void){
        
        let storageRef = Storage.storage().reference(withPath: "Users/\(user!)/Messages")
        
        storageRef.listAll { (result, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
                
            }
            
            for item in result.items {
                
                item.getData(maxSize: 10*1024*1024) { (data, error) in
                    
                    if let error = error {
                        
                        print(error.localizedDescription)
                        
                        return
                        
                    }
                    
                    let messages = [data!]
                    
                    completed(messages)
                    
                }
                
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
