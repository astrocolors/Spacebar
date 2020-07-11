//
//  ShortCell.swift
//  Spacebar
//
//  Created by Shamik Patro on 7/9/20.
//  Copyright © 2020 Astronomical. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ShortCell: UITableViewCell {

    static let reuseID = "ShortCell"
    
    var imageViewer = UIImageView()
    
    let videoPlayer = AVPlayerLayer(player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video", ofType: "mp4")!)))
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //configurePlayer()
        configureImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func configurePlayer(){
        
        layer.frame = bounds
        videoPlayer.videoGravity = .resizeAspectFill
        
        layer.addSublayer(layer)
        
        videoPlayer.player?.play()
        
    }
    
    func configureImage(){
        
        addSubview(imageViewer)
        
        imageViewer.image = UIImage(named: "Moon")
        
        imageViewer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            imageViewer.topAnchor.constraint(equalTo: topAnchor),
            imageViewer.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageViewer.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageViewer.heightAnchor.constraint(equalTo: heightAnchor)
            
        ])
        
        
    }
    
}
