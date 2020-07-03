//
//  HomeNM.swift
//  Spacebar
//
//  Created by Shamik Patro on 7/2/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: Network manager for Messages & Photos

import UIKit
import Firebase
import FirebaseStorage

class HomeNM {
    
    static let shared = HomeNM()
    
    let user = Firebase.Auth.auth().currentUser
    
    private init() {}
    
    func isSignedIn() -> String?{
    
        if user == nil {
            
            return nil
            
        }
        
        else {
            
            return user?.email
            
        }
        
    }
    
    func getMessages(){
        
        //Finish
    
        if isSignedIn() != nil {
            
            let messageRef = Storage.storage().reference().child("gs://spacebar-21236.appspot.com/Users/\(user)/following")
            
            
            
        }
        
    }
    
    func getPhotos(){
        
        
        
        
        
        
    }
    
    func postMessages(){
        
        
        
        
        
    }
    
    func postPhotos(){
        
        
        
        
        
    }
    
    func getLikes(){
        
        
        
        
        
    }
    
    func getComments(){
        
        
        
        
        
    }
    
    func getReposts(){
        
        
        
        
        
    }
    
    func reportPost(){
        
        
        

        
    }
    
}
