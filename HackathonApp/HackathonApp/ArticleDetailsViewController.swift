//
//  ArticleDetailsViewController.swift
//  HackathonApp
//
//  Created by WjdanMo on 16/12/2021.
//

import UIKit

class ArticleDetailsViewController: UIViewController {

    let article = UILabel()
    let articleTitle = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        articleTitle.frame = CGRect(x: 20, y: 30, width: view.frame.width - 40, height: 80)
        articleTitle.backgroundColor = .green
        articleTitle.text = "مبادرة السعودية الخضراء"
        articleTitle.font = .boldSystemFont(ofSize: 25)
        articleTitle.textAlignment = .right
        
        
        article.frame = CGRect(x: 20, y: 140, width: view.frame.width - 40, height: 500)
        article.backgroundColor = .red
        article.textAlignment = .right
//        article.font = .systemFont(ofSize: 20)
        article.numberOfLines = 0
        article.textColor = .black
        view.addSubview(articleTitle)
        view.addSubview(article)
        
    }
    
}
