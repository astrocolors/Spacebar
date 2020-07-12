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
    
    static let reuseID = "VideosCell"
    
    var videoImageView              = UIImageView()
    var videoTitleLabel             = UILabel()
    var viewCount                   = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureImageView()
        configureTitleLabel()
        configureViewCount()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(video: Video){
        
        // videoImageView.image = Needs to transform URL data -> Image
        videoTitleLabel.text = video.Title
        
        
    }
    
    func configureImageView(){
        
        addSubview(videoImageView)
        
        videoImageView.image = UIImage(named: "Spacebar")
        
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            videoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            videoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            videoImageView.heightAnchor.constraint(equalToConstant: 180),
            videoImageView.widthAnchor.constraint(equalTo: videoImageView.heightAnchor, multiplier: 16/9)
            
        ])
        
    }
    
    func configureTitleLabel(){
        
        addSubview(videoTitleLabel)
        
        videoTitleLabel.text =  "Video Title"
        videoTitleLabel.numberOfLines                               = 0
        videoTitleLabel.adjustsFontSizeToFitWidth                   = true
        videoTitleLabel.translatesAutoresizingMaskIntoConstraints   = false
        
        NSLayoutConstraint.activate([
            
            videoTitleLabel.topAnchor.constraint(equalTo: videoImageView.bottomAnchor, constant: 5),
            videoTitleLabel.leadingAnchor.constraint(equalTo: videoImageView.leadingAnchor, constant: 10),
            videoTitleLabel.heightAnchor.constraint(equalToConstant: 25),
            videoTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
            
        ])
        
    }
    
    func configureViewCount(){
        
        addSubview(viewCount)
        
        viewCount.font = UIFont(name: "Times New Roman", size: 12)
        
        viewCount.text = "301 Views"
        
        viewCount.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            viewCount.topAnchor.constraint(equalTo: videoTitleLabel.bottomAnchor, constant: -5),
            viewCount.leadingAnchor.constraint(equalTo: videoTitleLabel.leadingAnchor),
            viewCount.trailingAnchor.constraint(equalTo: videoTitleLabel.trailingAnchor),
            viewCount.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        
        
    }
    
}
