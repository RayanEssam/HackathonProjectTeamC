//
//  SayingCell.swift
//  HackathonApp
//
//  Created by WjdanMo on 16/12/2021.
//

import UIKit

class SayingCell: UICollectionViewCell {
    
    let cellID = "sayingID"
    
    let saying = UILabel()
    
    let view = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        view.frame = CGRect(x: 0, y: 0, width: 260, height: 120)
        view.layer.cornerRadius = 8
        view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        
        saying.frame = CGRect(x: 20, y: 10, width: 220, height: 100)
        saying.numberOfLines = 0
        saying.textAlignment = .right
        saying.textColor = .white
        
        self.addSubview(view)
        self.addSubview(saying)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
