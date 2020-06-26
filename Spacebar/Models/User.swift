//
//  User.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  First video in the networking section - This is for display the user after searching for them

import Foundation

struct User: Codable {
    
    var login: String?
    var avatarUrl: String?
    var name: String?
    var bio: String?
    var followers: Int
    var following: Int
    
}
