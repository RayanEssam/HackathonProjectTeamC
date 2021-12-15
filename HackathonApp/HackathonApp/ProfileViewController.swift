//
//  ProfileViewController.swift
//  HackathonApp
//
//  Created by Rayan Taj on 15/12/2021.
//

import UIKit
import Firebase
class ProfileViewController: UIViewController {
    let db = Firestore.firestore()
    let email = Auth.auth().currentUser!.email!
    let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
    let signOutButton = UINavigationItem()
    let lineView = UIView()
    let profileImage = UIImageView()
    let emailLable = UILabel()
    let NameLable = UILabel()
    let scoreLable = UILabel()
    let numberOfTreesLable = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //MARK: - SignOutButton
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        let largeBoldArrow = UIImage(systemName: "rectangle.portrait.and.arrow.right", withConfiguration: largeConfig)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: largeBoldArrow, style: .plain, target: self, action: #selector(signOut))
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.867621541, green: 0.1653445661, blue: 0.2664638758, alpha: 1)
        //MARK: - SeparatorLine
        lineView.backgroundColor = #colorLiteral(red: 0.9411765933, green: 0.9411765337, blue: 0.9411766529, alpha: 1)
        lineView.frame = CGRect(x: 0 , y: 90, width: view.frame.size.width, height: 3)
        view.addSubview(lineView)
        //MARK: - ProfileImage
        profileImage.image = UIImage(systemName: "person.crop.circle")
        profileImage.frame = CGRect(x: 148, y: 150, width: 100, height: 100)
        profileImage.tintColor = #colorLiteral(red: 0.867621541, green: 0.1653445661, blue: 0.2664638758, alpha: 1)
        view.addSubview(profileImage)
        //MARK: - EmailLabel
       
        NameLable.textColor = #colorLiteral(red: 0.867621541, green: 0.1653445661, blue: 0.2664638758, alpha: 1)
        NameLable.frame = CGRect(x: 125, y: 250, width: 120, height: 50)
        NameLable.font = .systemFont(ofSize: 25, weight: .semibold)
        NameLable.textAlignment = .right
        view.addSubview(NameLable)
        
        
        
        scoreLable.text = "الدرجه"
        scoreLable.textColor = #colorLiteral(red: 0.867621541, green: 0.1653445661, blue: 0.2664638758, alpha: 1)
        scoreLable.frame = CGRect(x: 270, y: 450, width: 120, height: 50)
        scoreLable.font = .systemFont(ofSize: 25, weight: .semibold)
        scoreLable.textAlignment = .center
        view.addSubview(scoreLable)
        
        
        numberOfTreesLable.text = "عدد الاشجار"
        numberOfTreesLable.textColor = #colorLiteral(red: 0.867621541, green: 0.1653445661, blue: 0.2664638758, alpha: 1)
        numberOfTreesLable.frame = CGRect(x: 200, y: 520, width: 230, height: 50)
        numberOfTreesLable.font = .systemFont(ofSize: 25, weight: .semibold)
        numberOfTreesLable.textAlignment = .center
        view.addSubview(numberOfTreesLable)
        
        
        
        
        
        
        getData()
        
        
        
        
        
        
    }
    //MARK: - Methods
    @objc func signOut() {
        
        let alert = UIAlertController(title: "Alert", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Log Out", style: .destructive) { action in
            
            do {
                try Auth.auth().signOut()
                self.dismiss(animated: true, completion: nil)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        alert.addAction(action)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    
    func getData(){
        db.collection("Users").whereField("email", isEqualTo: Auth.auth().currentUser!.email!)
        
        .getDocuments { querySnapshot, error in
            
            if error == nil {
                
                let name = querySnapshot?.documents[0].get("name")!
                let score = querySnapshot?.documents[0].get("score")!
                let numberOfTrees = querySnapshot?.documents[0].get("numberOfTrees")!

                self.NameLable.text = "\(name!)"
                self.scoreLable.text = "النقاط \(score!)"
                self.numberOfTreesLable.text = "عدد الاشجار \(numberOfTrees!)"
                
//                for doc in querySnapshot!.documents {
//
//                let name = doc.get("name")!
//
//                    self.NameLable.text = "\(name)"
//
//                }
                
            } else {
                print(error!.localizedDescription)
            }
        }
    
    }
}
