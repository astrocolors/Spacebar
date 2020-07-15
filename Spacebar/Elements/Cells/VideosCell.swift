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
    let avatarImageView             = UIImageView()
    var videoTitleLabel             = UILabel()
    var userLabel                   = UILabel()
    var viewCount                   = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureImageView()
        configureUserAvatar()
        configureTitleLabel()
        configureUserLabel()
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
    
    func configureUserAvatar(){
        
        addSubview(avatarImageView)
        
        avatarImageView.contentMode                                  = .scaleAspectFit
        avatarImageView.clipsToBounds                                = true
        avatarImageView.layer.masksToBounds                          = true
        avatarImageView.backgroundColor                              = .blue
        avatarImageView.layer.cornerRadius                           = 20
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            avatarImageView.topAnchor.constraint(equalTo: videoImageView.bottomAnchor, constant: 20),
            avatarImageView.leadingAnchor.constraint(equalTo: videoImageView.leadingAnchor, constant: 20),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40)
            
        ])
        
        
    }
    
    func configureTitleLabel(){
        
        addSubview(videoTitleLabel)
        
        videoTitleLabel.text =  "This is going to be the title of the video."
        videoTitleLabel.numberOfLines                               = 0
        videoTitleLabel.adjustsFontSizeToFitWidth                   = true
        videoTitleLabel.translatesAutoresizingMaskIntoConstraints   = false
        
        NSLayoutConstraint.activate([
            
            videoTitleLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            videoTitleLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            videoTitleLabel.heightAnchor.constraint(equalToConstant: 25),
            videoTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
            
        ])
        
    }
    
    func configureUserLabel(){
        
        addSubview(userLabel)
        
        userLabel.text = "Astronaut"
        userLabel.font = UIFont(name: "Times New Roman", size: 14)
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            userLabel.topAnchor.constraint(equalTo: videoTitleLabel.bottomAnchor, constant: -3),
            userLabel.leadingAnchor.constraint(equalTo: videoTitleLabel.leadingAnchor),
            userLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        
    }
    
    func configureViewCount(){
        
        addSubview(viewCount)
        
        viewCount.font = UIFont(name: "Times New Roman", size: 14)
        viewCount.text = " • 301 Views"
        viewCount.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            viewCount.topAnchor.constraint(equalTo: videoTitleLabel.bottomAnchor, constant: -3),
            viewCount.leadingAnchor.constraint(equalTo: userLabel.trailingAnchor, constant: 2),
            viewCount.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        
    }
    
}
