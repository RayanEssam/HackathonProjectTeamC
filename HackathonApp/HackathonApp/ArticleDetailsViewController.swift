//
//  ArticleDetailsViewController.swift
//  HackathonApp
//
//  Created by WjdanMo on 16/12/2021.
//

import UIKit

class ArticleDetailsViewController: UIViewController {

    let article = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        article.frame = CGRect(x: 20, y: 0, width: view.frame.width - 40, height: view.frame.height - 100)
        article.textAlignment = .right
        article.numberOfLines = 0
        article.textColor = .black
        view.addSubview(article)
        
    }
    
}
