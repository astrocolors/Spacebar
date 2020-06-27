//
//  SideMenuCell.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/27/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: These are the cells displayed each time the sideMenu is called

import UIKit

class SideMenuCell: UITableViewCell {
    
    static let reuseID = "Orbiters"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
