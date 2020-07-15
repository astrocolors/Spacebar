//
//  DataCollectionCell.swift
//  Spacebar
//
//  Created by Shamik Patro on 7/14/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit

class DataCollectionCell: UITableViewCell {
    
    static let reuseID = "DataCollectionCell"
    
    let normalSwitch = UISwitch()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        
    }
    
    func configure(){
    
        
        
        
        
    }

}
