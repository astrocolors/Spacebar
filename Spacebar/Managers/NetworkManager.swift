//
//  NetworkManager.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Change the base URL to your database!

import Foundation

class NetworkManager {
    
    static let shared       = NetworkManager()
    let baseURL             = "https://api.github.com"
    
    private init(){}
        
    func getSearchUsers(for username: String, page: Int, completed: @escaping ([SearchUser]?, String?) -> Void){
            
        let endpoint = baseURL + "/users/\(username)/followers?per_page=100&page=\(page)"
            
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
        
}
