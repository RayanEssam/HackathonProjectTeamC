//
//  ProfileViewController.swift
//  HackathonApp
//
//  Created by Rayan Taj on 15/12/2021.
//

import UIKit
import Firebase
class ProfileViewController: UIViewController {
    let customAlert = LogoutAlert()
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
    let tracking = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //MARK: - SignOutButton
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        let largeBoldArrow = UIImage(systemName: "rectangle.portrait.and.arrow.right", withConfiguration: largeConfig)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: largeBoldArrow, style: .plain, target: self, action: #selector(signOut))
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        //MARK: - SeparatorLine
        lineView.backgroundColor = #colorLiteral(red: 0.9411765933, green: 0.9411765337, blue: 0.9411766529, alpha: 1)
        lineView.frame = CGRect(x: 0 , y: 90, width: view.frame.size.width, height: 3)
        view.addSubview(lineView)
        //MARK: - ProfileImage
        profileImage.image = UIImage(systemName: "person.crop.circle")
        profileImage.frame = CGRect(x: 145, y: 130, width: 100, height: 100)
        profileImage.tintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        view.addSubview(profileImage)
        //MARK: - EmailLabel
        
        NameLable.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        NameLable.frame = CGRect(x: 0, y: 240, width: 385, height: 50)
        NameLable.font = .systemFont(ofSize: 25, weight: .semibold)
        NameLable.textAlignment = .center
        view.addSubview(NameLable)
        
        
        
        scoreLable.text = "الدرجة"
        scoreLable.layer.masksToBounds = true
        scoreLable.layer.cornerRadius = 15
        scoreLable.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        scoreLable.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        scoreLable.frame = CGRect(x: 20, y: 400, width: 350, height: 35)
        scoreLable.font = .systemFont(ofSize: 20, weight: .semibold)
        scoreLable.textAlignment = .center
        view.addSubview(scoreLable)
        
        
        numberOfTreesLable.text = "عدد الأشجار"
        numberOfTreesLable.layer.masksToBounds = true
        numberOfTreesLable.layer.cornerRadius = 15
        numberOfTreesLable.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        numberOfTreesLable.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        numberOfTreesLable.frame = CGRect(x: 20, y: 340, width: 350, height: 35)
        numberOfTreesLable.font = .systemFont(ofSize: 20, weight: .semibold)
        numberOfTreesLable.textAlignment = .center
        view.addSubview(numberOfTreesLable)
        getData()
        
        tracking.setTitle("تتبع الطلب", for: .normal)
        tracking.backgroundColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        tracking.setTitleColor(UIColor (#colorLiteral(red: 0.9411765933, green: 0.9411765337, blue: 0.9411766529, alpha: 1)), for: .normal)
        tracking.layer.cornerRadius = 15
        tracking.frame = CGRect(x: 20, y: 460, width: 350, height: 35)
        tracking.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        tracking.createShadowButton()
        tracking.addTarget(self, action: #selector(navigateToRequestsVC), for: .touchUpInside)
        view.addSubview(tracking)
        //
        let treeimage = UIImageView()
        treeimage.image = UIImage(named: "p16")
        treeimage.frame = CGRect(x: 25, y: 600, width: 350, height: 100)
        treeimage.contentMode = .scaleAspectFill
        view.addSubview(treeimage)
    }
  
    //MARK: - Methods
    @objc func signOut() {
        
        customAlert.showAlert(with: "تنبيه", message: "هل أنت متأكد أنك تريد تسجيل الخروج؟", on: self)
        
    }
    
    @objc func logout() {
        customAlert.logout()
    }
    @objc func dismissAlert() {
        customAlert.dismissAlert()
    }
    
    @objc func navigateToRequestsVC(){
            let vc = RequestConfirmationViewController()
            vc.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(vc, animated: true)
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
                    self.numberOfTreesLable.text = "عدد الأشجار \(numberOfTrees!)"
                    
                    
                } else {
                    print(error!.localizedDescription)
                }
            }
    }
}

class LogoutAlert: UIViewController {
    let vc = ViewController()
    struct Constants {
        static let backgroundAlphaTo: CGFloat = 0.6
    }
    
    private var backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0
        return backgroundView
    }()
    
    private var alertView: UIView = {
        let alert = UIView()
        alert.backgroundColor = .white
        alert.layer.masksToBounds = true
        alert.layer.cornerRadius = 20
        return alert
    }()
    private var myTargetView = UIView()
    func showAlert(with title: String, message: String, on viewController: UIViewController) {
        guard let targetView = viewController.view else {return}
        myTargetView = targetView
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        targetView.addSubview(alertView)
        alertView.frame = CGRect(x: 40, y: -250, width: targetView.frame.size.width-80, height: 250)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: alertView.frame.size.width, height: 50))
        titleLabel.text = title
        titleLabel.textColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        titleLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        titleLabel.textAlignment = .center
        alertView.addSubview(titleLabel)
        
        let messageLabel = UILabel(frame: CGRect(x: -10, y: 30, width: alertView.frame.size.width, height: 130))
        
        messageLabel.numberOfLines = 0
        messageLabel.text = message
        messageLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        messageLabel.textColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        messageLabel.textAlignment = .right
        alertView.addSubview(messageLabel)
        
        let logoutButton =  UIButton(frame: CGRect(x: 20, y: alertView.frame.size.height-100, width: alertView.frame.size.width-40, height: 50))
        logoutButton.setTitle("تسجيل الخروج", for: .normal)
        logoutButton.setTitleColor(#colorLiteral(red: 0.9411765933, green: 0.9411765337, blue: 0.9411766529, alpha: 1), for: .normal)
        logoutButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        logoutButton.backgroundColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        logoutButton.layer.cornerRadius = 25
        logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        alertView.addSubview(logoutButton)
        
        let button =  UIButton(frame: CGRect(x: 20, y: alertView.frame.size.height-50, width: alertView.frame.size.width-40, height: 50))
        button.setTitle("إخفاء", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        alertView.addSubview(button)
        
        
        UIView.animate(withDuration: 0.25, animations: {
            self.backgroundView.alpha = Constants.backgroundAlphaTo
        }, completion: { done in
            if done {
                
                UIView.animate(withDuration: 0.25, animations: {
                    self.alertView.center = targetView.center
                })
            }
        })
    }
    
        func signOut() {
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc func logout() {
        signOut()
        do {
            try Auth.auth().signOut()
            dismissAlert()
            signOut()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    @objc func dismissAlert() {
        
        UIView.animate(withDuration: 0.25, animations: {
            self.alertView.frame = CGRect(x: 40, y: self.myTargetView.frame.size.height, width: self.myTargetView.frame.size.width-80, height: 250)
            
        }, completion: { done in
            if done {
                
                UIView.animate(withDuration: 0.25, animations: {
                    self.backgroundView.alpha = 0
                }, completion: {done in
                    if done {
                        self.alertView.removeFromSuperview()
                        self.backgroundView.removeFromSuperview()
                    }
                })
            }
        })
    }
    
}
