//
//  ArticleCell.swift
//  HackathonApp
//
//  Created by WjdanMo on 16/12/2021.
//

import UIKit

class ArticleCell: UICollectionViewCell {
    let cellID = "ArticleID"
        let article = UILabel()
    let view = UIView(frame: CGRect(x: 10, y: 0, width: 40, height: 40))

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        article.frame = CGRect(x: 0, y: 0, width: self.frame.width - 20, height: self.frame.height )
        article.numberOfLines = 0
        article.textAlignment = .right
        self.addSubview(article)
        
        self.layer.cornerRadius = 8
        self.addSubview(view)
        
        }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
