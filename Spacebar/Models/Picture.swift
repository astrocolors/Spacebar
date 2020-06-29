//
//  Picture.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/29/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: This stores the information for pictures in a network call

import Foundation

struct Picture: Codable, Hashable {
    
    var pictureURL: String?
    var likes: Int?
    var commentNumber: Int?
    
    
}
