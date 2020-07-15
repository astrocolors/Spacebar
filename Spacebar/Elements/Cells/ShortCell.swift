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
import Lottie

class ShortCell: UITableViewCell {

    static let reuseID = "ShortCell"
    
    var imageViewer = UIImageView()
    let animationView = AnimationView()
    
    //let videoPlayer = AVPlayerLayer(player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video", ofType: "mp4")!)))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //configurePlayer()
        configureImage()
        configureDoubleTap()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func configureImage(){
        
        addSubview(imageViewer)
        
        imageViewer.image = UIImage(named: "Moon")
        
        imageViewer.isUserInteractionEnabled = true
        
        imageViewer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            imageViewer.topAnchor.constraint(equalTo: topAnchor),
            imageViewer.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageViewer.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageViewer.heightAnchor.constraint(equalTo: heightAnchor)
            
        ])
        
    }
    
    func configureDoubleTap(){
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        
        doubleTap.numberOfTapsRequired = 2
        
        imageViewer.addGestureRecognizer(doubleTap)
        
    }
    
    func configureAnimation(){
        
        addSubview(animationView)
        animationView.alpha = 0
        animationView.frame = self.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.animation = Animation.named("Favorite")
        
        UIView.animate(withDuration: 0.2) {
            
            UIView.animate(withDuration: 0.2) {
                
                self.animationView.alpha = 1
                
            }
            
            self.animationView.play { (finished) in
                
                UIView.animate(withDuration: 0.2) {
                    
                    self.animationView.alpha = 0
                    
                }
                
            }
            
        }
        
    }
    
    @objc func doubleTapped(){
        
        configureAnimation()
        
    }
    
}
