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
        let treeimage = UIImageView()
        treeimage.image = UIImage(named: "p11")
        treeimage.frame = CGRect(x: 35, y: 500, width: 300, height: 160)
        treeimage.contentMode = .scaleAspectFill
        view.addSubview(treeimage)
        //
        let firstlabel = UILabel()
        firstlabel.text = "تم زراعة ١٠ ملايين شجرة"
        firstlabel.frame = CGRect(x: 25, y: 100 , width:350, height: 25)
        firstlabel.textAlignment = .center
        firstlabel.textColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        firstlabel.font = .boldSystemFont(ofSize: 30)
        view.addSubview(firstlabel)
        
        let secondlabel = UILabel()
        secondlabel.text = "٩.٩٩ مليار شجرة متبقية"
        secondlabel.frame = CGRect(x: 25, y: 150 , width: 350, height: 25)
        secondlabel.textAlignment = .center
        secondlabel.textColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        secondlabel.font = .systemFont(ofSize: 17)
        view.addSubview(secondlabel)
        
        
        let targetTextLabel = UILabel(frame: CGRect(x: 300, y: 180, width: 60, height:60))
        //        targetTextLabel.center = view.center
        targetTextLabel.textAlignment = .center
        //        targetTextLabel.backgroundColor = .white
        targetTextLabel.numberOfLines = 3
        targetTextLabel.font = .systemFont(ofSize: 10)
        targetTextLabel.textColor = #colorLiteral(red: 0.1674584448, green: 0.3054045737, blue: 0.260445863, alpha: 1)
        targetTextLabel.layer.cornerRadius = 100
        targetTextLabel.text = "٤٠ مليار شجرة"
        
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.frame = CGRect(x: 20, y: 200, width: 345, height: 45)
        //        progressView.center = view.center
        progressView.transform = CGAffineTransform(scaleX: 1, y: 6)
        progressView.setProgress(0.3, animated: true)
        progressView.trackTintColor = .white
        progressView.tintColor =  #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        view.addSubview(progressView)
        
        let mainTextLabel = UILabel(frame: CGRect(x: 0, y: 250, width: 400, height:200))
        //        mainTextLabel.center = view.center
        mainTextLabel.textAlignment = .center
        mainTextLabel.numberOfLines = 3
        mainTextLabel.font = .boldSystemFont(ofSize: 30)
        mainTextLabel.textColor =  .black
        //        mainTextLabel.backgroundColor = UIColor(patternImage: UIImage(named: "back")!)
                mainTextLabel.text = "سنقود الحقبة الخضراء القادمة داخل المملكة وخارجها"
      
        
        
        
        let mainActionButton = UIButton(frame: CGRect(x: 20, y: 700, width: 345, height: 40))
        mainActionButton.setTitle("اغرسها", for: .normal)
        mainActionButton.backgroundColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        mainActionButton.setTitleColor(.white, for: .normal)
        mainActionButton.layer.cornerRadius = 15
        mainActionButton.addTarget(self, action: #selector(requestViewController), for: .touchUpInside)
        view.addSubview(mainActionButton)
        
        //        view.backgroundColor =  UIColor(patternImage: UIImage(named: "p17")!)
        view.backgroundColor = .white
        
        view.addSubview(mainTextLabel)
        //        view.addSubview(targetTextLabel)
        
    }
    
    @objc func requestViewController() {
        
        let requestVC = RequestPrepartionViewController()
        requestVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(requestVC, animated: true)
        
        
    }
    
    
    
}


