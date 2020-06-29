//
//  NetworkManager.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: This manages the overall network calls in the application
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
    
    func getFollowers(){
        
        let endpoint = baseURL + ""
        
        
        
    }
    
    func getDMUsers(){
        
        let endpoint = baseURL + ""
        
        
        
        
    }
    
    func getDMMessages(){
        
        let endpoint = baseURL + ""
        
        
        
        
    }
    
    func getUserSpecificClips(for Username: String, completed: @escaping([URL?], String?) -> Void){
        
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
    
    func uploadMessage(){
        
        let endpoint = baseURLV2 + ""
        
        
        
        
    }
    
    
    func uploadClips(){
        
        let endpoint = baseURLV2 + ""
        
        
        
        
    }
    
    
    func sendDM(){
        
        let endpoint = baseURLV2 + ""
        
        
        
    }
    
    
}
