//
//  User.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: First video in the networking section - This is the information for the user once clicked on

import Foundation

struct User: Codable, Hashable {
    
    var login: String?
    var avatarData: Data?
    var name: String?
    var bio: String?
    var followers: Int
    var following: Int
    
}
