//
//  VideoCell.swift
//  HackathonApp
//
//  Created by WjdanMo on 16/12/2021.
//

import UIKit

class VideoCell: UICollectionViewCell {
    
    let cellID = "videoID"
    
    var thumbnail = UIImageView()
    var playButton = UIImageView()
    var videoTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        thumbnail.frame = CGRect(x: 0, y: 0, width: 220, height: 130)
        thumbnail.layer.cornerCurve = .circular
        thumbnail.layer.shadowOffset = CGSize(width: 2, height: 2)
        thumbnail.layer.shadowColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        
        playButton.image = UIImage(systemName: "play.fill")
        playButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        playButton.center = thumbnail.center
        playButton.tintColor = .white
        
        videoTitle.frame = CGRect(x: 5, y: 130, width: 210, height: 50)
        videoTitle.numberOfLines = 0
        videoTitle.textAlignment = .center
        videoTitle.font = .boldSystemFont(ofSize: 13)
        videoTitle.textColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        
        self.addSubview(thumbnail)
        self.addSubview(playButton)
        self.addSubview(videoTitle)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
