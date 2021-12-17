//
//  HomeViewController.swift
//  HackathonApp
//
//  Created by Rayan Taj on 15/12/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    let infoArray = [
        "سنقود الحقبة الخضراء القادمة داخل المملكة وخارجها .",
        "نحن عازمون بطموحنا الكبير، وخبراتنا الواسعة، وإبداعنا اللامحدود على أن نصنع الفرق." ,
        "نحن عازمون بطموحنا الكبير، و خبراتنا الواسعة، و إبداعنا اللامحدود على أن نصنع الفرق. مرحباً بكم    في مبادرة السعودية الخضراء ."]
    
    var collectionView: UICollectionView!
    var timer = Timer()
    var counter = 0
    
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
        firstlabel.frame = CGRect(x: 25, y: 120 , width:350, height: 25)
        firstlabel.textAlignment = .center
        firstlabel.textColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        firstlabel.font = .boldSystemFont(ofSize: 30)
        view.addSubview(firstlabel)
        
        let secondlabel = UILabel()
        secondlabel.text = "٩.٩٩ مليار شجرة متبقية"
        secondlabel.frame = CGRect(x: 25, y: 165 , width: 350, height: 25)
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
        progressView.frame = CGRect(x: 20, y: 220, width: 345, height: 45)
        //        progressView.center = view.center
        progressView.transform = CGAffineTransform(scaleX: 1, y: 6)
        progressView.setProgress(0.3, animated: true)
        progressView.trackTintColor = .white
        progressView.tintColor =  #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        progressView.semanticContentAttribute = .forceRightToLeft
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        view.addSubview(progressView)
        
        collectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let cv = UICollectionView(frame: CGRect(x: 0, y: 300, width: 400, height: 120), collectionViewLayout: layout)
            cv.isPagingEnabled = true
            cv.showsHorizontalScrollIndicator = false
            cv.semanticContentAttribute = .forceRightToLeft
            layout.itemSize = CGSize(width: view.frame.width, height: 120)
            layout.minimumInteritemSpacing = 50
            return cv
        }()
        
        view.addSubview(collectionView)
        
        collectionView.register(AutoScrollingCell.self, forCellWithReuseIdentifier: "cellID")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let pageControl = UIPageControl()
        pageControl.frame = CGRect(x: 100, y: 450, width: 100, height: 30)
        pageControl.numberOfPages = infoArray.count
        pageControl.currentPage = 0
        pageControl.tintColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        view.addSubview(pageControl)
        
        // setting the timer for collection view
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(scrollToNextCell), userInfo: nil, repeats: true)
        
        let mainActionButton = UIButton(frame: CGRect(x: 20, y: 700, width: 345, height: 40))
        mainActionButton.setTitle("اغرسها", for: .normal)
        mainActionButton.backgroundColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        mainActionButton.setTitleColor(.white, for: .normal)
        mainActionButton.layer.cornerRadius = 15
        mainActionButton.createShadowButton()
        mainActionButton.addTarget(self, action: #selector(requestViewController), for: .touchUpInside)
        view.addSubview(mainActionButton)
        
        //        view.backgroundColor =  UIColor(patternImage: UIImage(named: "p17")!)
        view.backgroundColor = .white
        
        //        view.addSubview(mainTextLabel)
        //        view.addSubview(targetTextLabel)
        
    }
    
    @objc func requestViewController() {
        
        let requestVC = RequestPrepartionViewController()
        requestVC.modalPresentationStyle = .fullScreen
        navigationController?.navigationBar.tintColor =  #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        navigationController?.pushViewController(requestVC, animated: true)
        
    }
    
    @objc func scrollToNextCell(){
        if counter < infoArray.count {
            collectionView.scrollToItem(at: IndexPath(item: counter, section: 0), at: .centeredHorizontally, animated: true)
            counter += 1
        }
        else {
            counter = 0
            collectionView.scrollToItem(at: IndexPath(item: counter, section: 0), at: .centeredHorizontally, animated: true)

        }
    }
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! AutoScrollingCell
        
        cell.info.text = infoArray[indexPath.row]
        
        return cell
    }
}

extension UICollectionView {
    func scrollToNextItem() {
        let contentOffset = CGFloat(floor(self.contentOffset.x + self.bounds.size.width))
        self.moveToFrame(contentOffset: contentOffset)
    }
    
    func scrollToPreviousItem() {
        let contentOffset = CGFloat(floor(self.contentOffset.x - self.bounds.size.width))
        self.moveToFrame(contentOffset: contentOffset)
    }
    
    func moveToFrame(contentOffset : CGFloat) {
        self.setContentOffset(CGPoint(x: contentOffset, y: self.contentOffset.y), animated: true)
    }
}
