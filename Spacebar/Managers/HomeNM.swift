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
    var sounds: [Data?] = []
    
    static let shared = HomeNM()
    let baseURL = "gs://spacebar-21236.appspot.com/Users/"
    let user = Firebase.Auth.auth().currentUser?.email // Change in a second
    
    
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
        
        let uniqueID = UUID.init().uuidString
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        
        let photoData = Photo.jpegData(compressionQuality: 0.75)
        
        let storageRef = Storage.storage().reference(withPath: "Users/\(user!)/Photos/\(uniqueID)")
        
        storageRef.putData(photoData!, metadata: metaData)
        
    }
    
    func getLikes(){
        
        
        
        
        
    }
    
    func getComments(){
        
        
        
        
        
    }
    
    func getReposts(){
        
        
        
        
        
    }
    
    func reportPost(){
        
        
        // Actually send a report to the server!
        
        print("ayylmao")

        
    }
    
}
