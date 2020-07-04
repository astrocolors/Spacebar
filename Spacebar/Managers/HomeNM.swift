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
    
    var messages: [String?] = []
    var pictures: [Data?] = []
    
    
    static let shared = HomeNM()
    let baseURL = "gs://spacebar-21236.appspot.com/Users/"
    let user = Firebase.Auth.auth().currentUser?.email
    
    private init() {}
    
    func isSignedIn() -> String?{
    
        if user == nil {
            
            return nil
            
        }
        
        else {
            
            return user
            
        }
        
    }
    
    func getMessages(){
        
        //Finish
    
        if isSignedIn() != nil {
            
            let messageRef = Storage.storage().reference().child("gs://spacebar-21236.appspot.com/Users/\(user)/following")
            
            
            
        }
        
    }
    
    func getPhotos(){
        
        let folderURL = baseURL + "\(user!)/Photos/"
        
        print(folderURL)
        
        let strorageRef = Storage.storage().reference().child(folderURL)
        
        strorageRef.listAll { (result, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
                
            }
            
            for item in result.items {
                
                item.getData(maxSize: 4*1024*1024) { (data, error) in
                    
                    if let error = error {
                        
                        print(error.localizedDescription)
                        
                        
                    }
                    
                    
                }
                
                
            }
            
        }
        
    }
    
    func postMessages(){
        
        let folderURL = baseURL + "\(user)/Messages"
        
        
        
    }
    
    func postPhotos(){
        
        let folderURL = baseURL + "\(user)/Photos"
        
        
        
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
