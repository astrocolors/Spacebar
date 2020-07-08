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
    
    func isSignedIn() -> String?{
        
        if user == nil {
            
            return nil
            
        }
        
        else {
            
            return user
            
        }
        
        
    }
    
    func getLogin() -> String?{
        
        // Includes profile picture, name, background picture, followers, following, bio, location, birthday, gender, & sex.
        
        if user != nil {
            
            return user
            
        }
        
        else {
            
            return nil
            
        }
        
    }
    
    func getMessages(){
        
        let folderURL = baseURL + "\(user!)/Messages"
        
        print(folderURL)
        
        let storageRef = Storage.storage().reference().child(folderURL)
        
        storageRef.listAll { (result, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
            
            }
            
            for item in result.items {
                
                print(item)
                
            }
            
        }
        
    }
    
    func getPhotos(completed: @escaping([Data?], String?) -> Void){
        
        let folderURL = baseURL + "\(userName)/Pictures"
        
        let storageRef = Storage.storage().reference().child(folderURL)
        
        storageRef.listAll { (result, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
                
            }
            
            for item in result.items {
                
                let photos = [item.fullPath]
                
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
