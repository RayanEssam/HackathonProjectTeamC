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
    let articleContent = UILabel()

    let view = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        view.frame = CGRect(x: 0, y: 0, width: 220, height: 150)
        view.layer.cornerRadius = 8
        view.backgroundColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        
        article.frame = CGRect(x: 20, y: 10, width: 180, height: 40)
        article.numberOfLines = 0
        article.textAlignment = .right
        article.textColor = .white
        article.font = .boldSystemFont(ofSize: 16)
        
        articleContent.frame = CGRect(x: 20, y: 40, width: 180, height: 80)
        articleContent.numberOfLines = 0
        articleContent.textAlignment = .right
        articleContent.textColor = .white
        
        self.addSubview(view)
        self.addSubview(article)
        self.addSubview(articleContent)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
