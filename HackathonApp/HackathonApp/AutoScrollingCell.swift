//
//  AutoScrollingCell.swift
//  HackathonApp
//
//  Created by WjdanMo on 16/12/2021.
//

import UIKit

class AutoScrollingCell: UICollectionViewCell {
    
    let cellID = "cellID"
    
    let info = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 8
        info.frame = CGRect(x: 0, y: 0, width: self.frame.width - 20, height: self.frame.height)
        info.textColor = .black
        info.font = .boldSystemFont(ofSize: 17)
        info.textAlignment = .center
        info.numberOfLines = 0
        info.textAlignment = .right
        self.addSubview(info)
        
        }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
