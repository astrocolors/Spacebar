//
//  VideosCell.swift
//  Spacebar
//
//  Created by Shamik Patro on 6/25/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//
//  Purpose: These are the cells that pops up every time there is a video on the screen

import UIKit

class VideosCell: UITableViewCell {
    
    var videoImageView      = UIImageView()
    var videoTitleLabel          = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureImageView()
        configureTitleLabel()
        
        addSubview(videoImageView)
        addSubview(videoTitleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(video: Video){
        
        // videoImageView.image = Needs to transform URL data -> Image
        videoTitleLabel.text = video.Title
        
        
    }
    
    func configureImageView(){
        
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            videoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            videoImageView.heightAnchor.constraint(equalToConstant: 80),
            videoImageView.widthAnchor.constraint(equalTo: videoImageView.heightAnchor, multiplier: 16/9)
            
        ])
        
    }
    
    func configureTitleLabel(){
        
        videoTitleLabel.numberOfLines                               = 0
        videoTitleLabel.adjustsFontSizeToFitWidth                   = true
        videoTitleLabel.translatesAutoresizingMaskIntoConstraints   = false
        
        NSLayoutConstraint.activate([
            
            videoTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            videoTitleLabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 20),
            videoTitleLabel.heightAnchor.constraint(equalToConstant: 80),
            videoTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
            
        ])
        
    }
    
}
