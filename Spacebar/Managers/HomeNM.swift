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
        
        let folderURL = baseURL + "\(user!)/Photos"
        
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
    
    func postMessages(Message: String?){
        
        let uniqueID = UUID.init().uuidString
        
        let folderURL = "Users/\(user!)/Messages/\(uniqueID)"
        
        let metaData = StorageMetadata()
        metaData.contentType = "text/plain"
        
        let messageData = Message?.data(using: .utf16)
        
        let storageRef = Storage.storage().reference().child(folderURL)
        
        storageRef.putData(messageData!, metadata: metaData)
        
    }
    
    func postPhotos(Photo: UIImage){
        
        // Fix this
    
        let uniqueID = UUID.init().uuidString
        
        let folderURL = "Users/\(user!)/Photos/\(uniqueID)"
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        
        let photoData = Photo
        
        let storageRef = Storage.storage().reference().child(folderURL)
        
        //storageRef.putData(messageData!, metadata: metaData)
        
        
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
