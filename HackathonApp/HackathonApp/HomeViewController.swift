//
//  HomeViewController.swift
//  HackathonApp
//
//  Created by Rayan Taj on 15/12/2021.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let targetTextLabel = UILabel(frame: CGRect(x: 300, y: 90, width: 60, height:60))
//        targetTextLabel.center = view.center
        targetTextLabel.textAlignment = .center
//        targetTextLabel.backgroundColor = .white
        targetTextLabel.numberOfLines = 3
        targetTextLabel.font = .systemFont(ofSize: 15)
        targetTextLabel.textColor = .white
        targetTextLabel.layer.cornerRadius = 100
        targetTextLabel.text = "مليار شجرة 40"
        
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.frame = CGRect(x: 20, y: 150, width: 345, height: 45)
//        progressView.center = view.center
        progressView.transform = CGAffineTransform(scaleX: 1, y: 6)
        progressView.setProgress(0.3, animated: true)
        progressView.trackTintColor = .white
        progressView.tintColor =  .green
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        view.addSubview(progressView)
        
        let mainTextLabel = UILabel(frame: CGRect(x: 20, y: 400, width: 300, height:70))
        mainTextLabel.center = view.center
        mainTextLabel.textAlignment = .center
        mainTextLabel.numberOfLines = 3
        mainTextLabel.font = .boldSystemFont(ofSize: 23)
        mainTextLabel.textColor = .white
        mainTextLabel.text = "سنقود الحقبة الخضراء القادمة داخل المملكة وخارجها"
        
        
        
        
        let mainActionButton = UIButton(frame: CGRect(x: 20, y: 700, width: 345, height: 40))
        mainActionButton.setTitle("اغرسها", for: .normal)
        mainActionButton.backgroundColor = .white
        mainActionButton.setTitleColor(.darkGray, for: .normal)
        mainActionButton.layer.cornerRadius = 15
        view.addSubview(mainActionButton)
        
        view.backgroundColor =  UIColor( patternImage: UIImage(named: "back")!)
        
        
        view.addSubview(mainTextLabel)
        view.addSubview(targetTextLabel)

    }
    



}
