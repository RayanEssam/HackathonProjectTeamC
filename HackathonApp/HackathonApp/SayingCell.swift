//
//  SayingCell.swift
//  HackathonApp
//
//  Created by WjdanMo on 16/12/2021.
//

import UIKit

class SayingCell: UICollectionViewCell {
    let cellID = "sayingID"
        
    let view = UIView(frame: CGRect(x: 10, y: 0, width: 40, height: 40))
    let saying = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 8
        saying.frame = CGRect(x: 0, y: 0, width: self.frame.width - 20, height: self.frame.height)
        saying.numberOfLines = 0
        saying.textAlignment = .right
        self.addSubview(saying)
        self.addSubview(view)
        
        }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
