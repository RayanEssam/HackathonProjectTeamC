//
//  ContnetViewController.swift
//  HackathonApp
//
//  Created by Abdullah AlRashoudi on 12/15/21.
//

import UIKit
import AVKit

class ContnetViewController: UIViewController {
    
    let videosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect(x: 0, y: 100, width: 400, height: 300), collectionViewLayout: layout)
        layout.itemSize = CGSize(width: 200, height: 180)
        layout.minimumInteritemSpacing = 50
        return cv
    }()
    
    let articleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect(x: 0, y: 350, width: 400, height: 150), collectionViewLayout: layout)
        layout.itemSize = CGSize(width: 200, height: 100)
        layout.minimumInteritemSpacing = 50
        return cv
    }()
    
    let sayingsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect(x: 0, y: 500, width: 400, height: 150), collectionViewLayout: layout)
        layout.itemSize = CGSize(width: 200, height: 120)
        layout.minimumInteritemSpacing = 50
        return cv
    }()
    
    let videoURL = ["https://youtu.be/NbGxpOwCPsA", "https://youtu.be/sMN4zi3QwgM"]
    
    let articlesArray = ["أن يسهم مشروع الرياض الخضراء، في رفع نصيب الفرد من المساحة الخضراء في المدينة، وزيادة نسبة المساحات الخضراء الإجمالية فيها من خلال إطلاق نشر وتكثيف التشجير في كافة عناصر المدينة ومختلف أرجائها، مع تحقيق الاستغلال الأمثل للمياه المعالجة في أعمال الري، بما يساهم في تحسين جودة الهواء وخفض درجات الحرارة في المدينة، وتشجيع السكان على ممارسة نمط حياة أكثر نشاطاً وحيوية بما ينسجم مع أهداف توجهات “رؤية المملكة 2030", " تسعى السعودية لزراعة عشرة مليارات شجرة خلال العقود القادمة في إطار حملة طموحة كشف عنها ولي العهد الأمير محمد بن سلمان لخفض انبعاثات الكربون ومكافحة التلوث وتدهور الأراضي وقال الأمير محمد إن السعودية تستهدف خفض انبعاثات الكربون “وذلك من خلال مشاريع الطاقة المتجددة التي ستوفر 50 بالمئة من إنتاج الكهرباء  داخل المملكة بحلول عام 2030. "]
    
    let sayingArray = [
        "مَنْ أَحْيَا أَرْضًا مَيْتَةً فَهِيَ لَهُ",
        "ما من امرىء يحيي أرضا فيشرب منها ذو كبد حَرَّى أو تصيب منها عافية إلا كتب الله بها أجرا",
        "من كانت له أرض فليزرعها، فإن لم يستطع وعجز عنها فليمنحها آخاه المسلم ولا يؤاجرها إياه",
        "إنْ قامَتِ الساعةُ وفي يدِ أحدِكمْ فَسِيلةٌ، فإنِ استطاعَ أنْ لا تقومَ حتى يَغرِسَها فلْيغرِسْهَا"]
    
    let playerViewController = AVPlayerViewController()
    var player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = .white
        
        //        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        //        layout.itemSize = CGSize(width: 200, height: 180)
        
        videosCollectionView.register(VideoCell.self, forCellWithReuseIdentifier: "videoID")
        
        articleCollectionView.register(ArticleCell.self, forCellWithReuseIdentifier: "ArticleID")
        
        sayingsCollectionView.register(SayingCell.self, forCellWithReuseIdentifier: "sayingID")
        
        videosCollectionView.backgroundColor = UIColor.white
        
        videosCollectionView.dataSource = self
        videosCollectionView.delegate = self
        
        articleCollectionView.delegate = self
        articleCollectionView.dataSource = self
        
        sayingsCollectionView.delegate = self
        sayingsCollectionView.dataSource = self
        
        view.addSubview(videosCollectionView)
        view.addSubview(articleCollectionView)
        view.addSubview(sayingsCollectionView)
        
        self.view = view
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
}

extension ContnetViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.videosCollectionView {
            
            return videoURL.count
        }
        
        else if collectionView == self.articleCollectionView {
            return articlesArray.count
        }
        
        else {
            return sayingArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.videosCollectionView {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoID", for: indexPath) as! VideoCell
            myCell.backgroundColor = #colorLiteral(red: 0.7488231063, green: 0.7156726718, blue: 1, alpha: 0.8470588235)
//            myCell.comminInit(vidURL : videoURL[indexPath.row])
            return myCell
        }
        
        else if collectionView == self.articleCollectionView{
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleID", for: indexPath) as! ArticleCell
            myCell.backgroundColor = #colorLiteral(red: 1, green: 0.7488913536, blue: 0.6484727859, alpha: 0.8470588235)
            myCell.article.text = articlesArray[indexPath.row]
            return myCell
        }
        else {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "sayingID", for: indexPath) as! SayingCell
            myCell.backgroundColor = #colorLiteral(red: 0.6981652379, green: 0.6907193661, blue: 1, alpha: 0.8470588235)
            myCell.saying.text = sayingArray[indexPath.row]
            return myCell
        }
    }
}

extension ContnetViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.videosCollectionView {
            playVideo(videoUrl: videoURL[indexPath.row])
        }
        
        else if collectionView == self.articleCollectionView {
            let articleVC = ArticleDetailsViewController()
            articleVC.article.text = articlesArray[indexPath.row]

            self.present(articleVC, animated: true, completion: nil)
        }
    }
    
    func playVideo(videoUrl: String){
        let url : URL = URL(string : videoUrl)!
        player = AVPlayer(url: url)
        playerViewController.player = player
        
        self.present(playerViewController, animated: true)
        self.playerViewController.player?.play()
    }
}
