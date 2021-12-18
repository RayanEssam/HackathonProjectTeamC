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
        let cv = UICollectionView(frame: CGRect(x: 0, y: 100, width: 400, height: 200), collectionViewLayout: layout)
        cv.semanticContentAttribute = .forceRightToLeft
        cv.showsHorizontalScrollIndicator = false
        layout.itemSize = CGSize(width: 240, height: 180)
        layout.minimumInteritemSpacing = 60
        return cv
    }()
    
    let articleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect(x: 0, y: 330, width: 400, height: 150), collectionViewLayout: layout)
        cv.semanticContentAttribute = .forceRightToLeft
        cv.showsHorizontalScrollIndicator = false
        layout.itemSize = CGSize(width: 240, height: 120)
        layout.minimumInteritemSpacing = 40
        return cv
    }()
    
    let sayingsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect(x: 0, y: 500, width: 400, height: 150), collectionViewLayout: layout)
        cv.semanticContentAttribute = .forceRightToLeft
        cv.showsHorizontalScrollIndicator = false
        layout.itemSize = CGSize(width: 280, height: 120)
        layout.minimumInteritemSpacing = 40
        return cv
    }()
    
    let videoURL = ["https://youtu.be/NbGxpOwCPsA", "https://youtu.be/sMN4zi3QwgM"]
    
    let thumbnails = [UIImage(named: "thumbnail1"), UIImage(named: "thumbnail2")]
    
    let videoTitles = ["السعودية الخضراء | حقبة جديدة من التغير المناخي", "Saudi Green Initiative and Middle East Green Initiative - A New Era of Climate Action"]
    
    let articlesArray = ["أن يسهم مشروع الرياض الخضراء، في رفع نصيب الفرد من المساحة الخضراء في المدينة، وزيادة نسبة المساحات الخضراء الإجمالية فيها من خلال إطلاق نشر وتكثيف التشجير في كافة عناصر المدينة ومختلف أرجائها، مع تحقيق الاستغلال الأمثل للمياه المعالجة في أعمال الري، بما يساهم في تحسين جودة الهواء وخفض درجات الحرارة في المدينة، وتشجيع السكان على ممارسة نمط حياة أكثر نشاطاً وحيوية بما ينسجم مع أهداف توجهات “رؤية المملكة 2030 .", "تسعى السعودية لزراعة عشرة مليارات شجرة خلال العقود القادمة في إطار حملة طموحة كشف عنها ولي العهد الأمير محمد بن سلمان لخفض انبعاثات الكربون ومكافحة التلوث وتدهور الأراضي وقال الأمير محمد إن السعودية تستهدف خفض انبعاثات الكربون “وذلك من خلال مشاريع الطاقة المتجددة التي ستوفر 50 بالمئة من إنتاج الكهرباء داخل المملكة بحلول عام 2030 . "]
    
    let sayingArray = [
        "« مَنْ أَحْيَا أَرْضًا مَيْتَةً فَهِيَ لَهُ »",
        "« ما من امرىء يحيي أرضا فيشرب منها ذو كبد حَرَّى أو تصيب منها عافية إلا كتب الله بها أجرا »",
        "« من كانت له أرض فليزرعها، فإن لم يستطع وعجز عنها فليمنحها آخاه المسلم ولا يؤاجرها إياه »",
        "« إنْ قامَتِ الساعةُ وفي يدِ أحدِكمْ فَسِيلةٌ، فإنِ استطاعَ أنْ لا تقومَ حتى يَغرِسَها فلْيغرِسْهَا »"]
    
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoID", for: indexPath) as! VideoCell
            cell.thumbnail.image = thumbnails[indexPath.row]
            cell.videoTitle.text = videoTitles[indexPath.row]
            
            return cell
        }
        
        else if collectionView == self.articleCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleID", for: indexPath) as! ArticleCell
            cell.article.text = Articles[indexPath.row].name
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sayingID", for: indexPath) as! SayingCell
            cell.saying.text = sayingArray[indexPath.row]
            
            return cell
        }
    }
}

extension ContnetViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.videosCollectionView {
            
            guard let url = URL(string: videoURL[indexPath.row]) else { return }
            UIApplication.shared.open(url)
            
        }
        
        else if collectionView == self.articleCollectionView {
            let articleVC = ArticleDetailsViewController()
            articleVC.articleTitle.text = Articles[indexPath.row].name
            articleVC.article.text = Articles[indexPath.row].content

            
            self.present(articleVC, animated: true, completion: nil)
        }
    }
}
