//
//  NetworkManager.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: This manages the overall network calls in the application
//
//  Organization: 'get', 'send', or 'post' function - (e.g. getLikes, sendDM, postMessage)
//
//  TODO: Change the base URL to your database!

import UIKit
import FirebaseStorage

class NetworkManager {
    
    static let shared       = NetworkManager()
    let baseURL             = "Users/"
    let baseURLV2           = "https://api.github.com"
    let cache               = NSCache<NSString, UIImage>()
    
    private init(){}
    
    func getVideos(){
        
        // Gets the videos from the server
        
        
        
        
        
    }

    func getLivestream(){
        
        // Gets livestreams... from the server?
        
        
        
        
        
    }
    
    
    func getNotifications(){
        
        // Gets recent notifications from the server
        
        
        
        
    }
    
    
    func getLikes(){
        
        // Gets the likes on any post (Message, Photo, Clip, or Video)
        
        
    }
    
    func getComments(){
        
        // Gets the comments on any post (Message, Photo, Clip, or Video)
        
        
        
    }
    
    func getReposts(){
        
        // Gets the reposts on any post (Message, Photo, or Clip)
        
        
        
    }
    
    func getFollowing(){
        
        // Gets the 'following' list for the popout side menu - empty if user isn't signed in
        
        
        
        
    }
    
    func getFollowers(){
        
        // Gets the follower list for profiles
        
        
        
    }
    
    func postClip(){
        
        // Uploads clip to server
        
        
        
        
    }
    
    
        
    
    func getSearchUsers(for username: String, page: Int, completed: @escaping ([SearchUser]?, String?) -> Void){
            
        let endpoint = baseURLV2 + "/users/\(username)/followers?per_page=100&page=\(page)"
            
        guard let url = URL(string: endpoint) else{
                
            completed(nil, "Error: Invalid username request! Did you type in the correct username? - Houston")
                
            return
                
        }
            
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
            if let _ = error {
                    
                completed(nil, "Error: Check your connection! - Houston")
                    
                return
                    
            }
                
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    
                completed(nil, "Error: Mission control couldn't send the requested data. Please try again! - Houston")
                    
                return
            }
                
            guard let data = data else {
                    
                completed(nil, error?.localizedDescription)
                    
                return
                    
            }
                
            do{
                  
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let searchUser = try decoder.decode([SearchUser].self, from: data)
                completed(searchUser, nil)
                    
            } catch{
                    
                completed(nil, error.localizedDescription)
                    
            }
                
                
        }
            
        task.resume()
            
    }
    
    func getSearchVideos(){
        
        
        // Implement search videos function
        
        
        
    }
    
    func getFollowers(for Username: String, completed: @escaping([String?], String?) -> Void){
        
        let folderURL = baseURL + "\(Username)/Followers/"
        
        let storageRef = Storage.storage().reference().child(folderURL)
        
        storageRef.listAll { (result, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
                
            }
            
            for item in result.items {
                
                let followers = [item.name]
                
                completed(followers, nil)
                
            }
            
        }
        
        
        
    }
    
    func getDMUsers(){
        
        let endpoint = baseURL + ""
        
        
        
        
    }
    
    func getDMMessages(for Username: String, for User: String, completed: @escaping([Data?], String?) -> Void){
        
        let folderURL = baseURL + "\(Username)/DM/RecievedMessage/\(User)/"
        
        let storageRef = Storage.storage().reference().child(folderURL)
        
        storageRef.listAll { (result, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
                
            }
            
            for item in result.items {
                
                item.getData(maxSize: (4*1024*1024)) { (data, error) in
                    
                    if let error = error {
                        
                        print(error.localizedDescription)
                        
                    }
                    
                    let DMMessages = [data]
                    
                    completed(DMMessages, nil)
                    
                }
                
            }
            
            
        }
        
        
        
        
    }
    
    func getUserSpecificClips(for Username: String, completed: @escaping([URL?], String?) -> Void){
        
        // FIX ME!!!
        
        let folderURL = baseURL + "\(Username)/Clips/"
        
        let storageRef = Storage.storage().reference().child(folderURL)
        
        storageRef.listAll { (result, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
                
            }
            
            for item in result.items {
                
                item.downloadURL { (url, error) in
                    
                    if let error = error {
                        
                        print(error.localizedDescription)
                        
                    }
                    
                    let clipsURL = [url]
                    
                    completed(clipsURL, nil)
                    
                }
                
            }
            
        }
        
    }
    
    func getUserSpecificPhotos(for Username: String, completed: @escaping([Data?], String?) -> Void){
        
        let folderURL = baseURL + "\(Username)/Pictures/"
        
        let storageRef = Storage.storage().reference().child(folderURL)
        
        storageRef.listAll { (result, error) in
            
            if let error = error{
                
                print(error.localizedDescription)
                
            }
            
            for item in result.items {
                
                item.getData(maxSize: (4*1024*1024)) { (data, error) in
                    
                    if let error = error {
                        
                        print(error.localizedDescription)
                        
                        
                    }
                    
                    let pictureData = [data]
                    
                    completed(pictureData, nil)
                    
                }
                
            }
            
        }
        
        
    }
    
    func getUserSpecificMessages(for Username: String, completed: @escaping([Data?], String?) -> Void){
        
        let folderURL = baseURL + "\(Username)/Messages"
        
        let storageRef = Storage.storage().reference().child(folderURL)
        
        storageRef.listAll { (result, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
                
            }
            
            for items in result.items {
                
                items.getData(maxSize: (4*1024*1024)) { (data, error) in
                    
                    if let error = error {
                    
                        print(error.localizedDescription)
                        
                    }
                    
                    let messageData = [data]
                    
                    completed(messageData, nil)
                    
                    
                }
                
                
            }
            
            
        }
        
        
    }
    
    func uploadMessage(for Username: String, Message: String){
        
        let randomID = UUID.init().uuidString
        let folderURL = baseURL + "\(Username)/Messages/\(randomID)/"
        
        let metadata = StorageMetadata()
        metadata.contentType = "text/plain"
        
        let storageRef = Storage.storage().reference().child(folderURL)
        let messageData = Message.data(using: .utf16)

        storageRef.putData(messageData!, metadata: metadata)
        
    }
    
    
    func uploadClips(){
        
        let endpoint = baseURLV2 + ""
        
        
        
        
    }
    
    
    func sendDM(){
        
        // Sends Direct Message to specific individual (encrypted)
        
        let endpoint = baseURLV2 + ""
        
        
        
    }
    
    func reportPosts(){
        
        // Sends a report on any post (Message, Photo, Clip, or Video)
        
        
        
        
    }
    
    
    
}
