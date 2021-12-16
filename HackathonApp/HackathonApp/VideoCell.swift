//
//  VideoCell.swift
//  HackathonApp
//
//  Created by WjdanMo on 16/12/2021.
//

import UIKit
import AVKit

class VideoCell: UICollectionViewCell {
    
    let cellID = "vidCell"
    
    var player : AVPlayer!
    
    var thumbnail : UIImageView!
    
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 8

        self.addSubview(view)
    }
    
    func comminInit(vidURL : String){
        let url = URL(string: vidURL)
        self.getThumbnailFromVideoURL(url: url!) { thumbnail in
            self.thumbnail.image = thumbnail
        }
    }
    
    func getThumbnailFromVideoURL(url : URL, completion: @escaping ((_ image : UIImage?)->Void)) {
        
//        DispatchQueue.global().async {
//
//            let asset = AVAsset()
//
//            let avAssetImageGenerator = AVAssetImageGenerator(asset: asset)
//
//            avAssetImageGenerator.appliesPreferredTrackTransform = true
//
//            let thumbnailTime = CMTimeMake(value: 2, timescale: 2)
//
//            do{
//                let cgThumbImage = try avAssetImageGenerator.copyCGImage(at: thumbnailTime, actualTime: nil)
//
//                let thumbImage = UIImage(cgImage : cgThumbImage)
//
//                DispatchQueue.main.async{
//                    completion(thumbImage)
//                }
//            }
//            catch{
//                print(error.localizedDescription)
//            }
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
