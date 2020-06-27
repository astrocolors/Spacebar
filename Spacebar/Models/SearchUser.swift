//
//  SearchUser.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/26/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: This is the information for the user when searched for

import Foundation

struct SearchUser: Codable, Hashable {
    
    var login: String?
    
    var avatarUrl: String?
    
}
