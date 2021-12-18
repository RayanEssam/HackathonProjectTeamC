//
//  TabBarViewController.swift
//  HackathonApp
//
//  Created by Abdullah AlRashoudi on 12/17/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: CommunitiesViewController())
        let vc3 = UINavigationController(rootViewController: ContnetViewController())
        let vc4 = UINavigationController(rootViewController: RankingViewController())
        let vc5 = UINavigationController(rootViewController: ProfileViewController())
       
        
       
        
        vc1.title = "الرئيسية"
        vc2.title = "المجتمعات"
        vc3.title = "المحتوى"
        vc4.title = "الترتيب"
        vc5.title = "الملف الشخصي"
        
        self.tabBar.semanticContentAttribute = .forceRightToLeft
     
        self.setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: true)


        
        guard let items = self.tabBar.items else {return}
        
        let images = ["house","person.3","note.text","list.star","person.crop.circle"]
        
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
        }
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        self.modalPresentationStyle = .fullScreen
    }
    

}
