//
//  CustomAlertViewController.swift
//  HackathonApp
//
//  Created by Abdullah AlRashoudi on 12/18/21.
//

import UIKit

class CustomAlertViewController: UIViewController {
    let customAlert = MyAlert()
    let myButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        myButton.frame = CGRect(x: 20, y: 200, width: 350, height: 34)
        myButton.setTitle("Button", for: .normal)
        myButton.setTitleColor(.black, for: .normal)
        view.addSubview(myButton)
        myButton.addTarget(self, action: #selector(button), for: .touchUpInside)
    }

    @objc func button() {
        
        customAlert.showAlert(with: "hello", message: "this is my custom alert", on: self)
    }
    
    @objc func dismissAlert() {
        customAlert.dismissAlert()
    }
}

class MyAlert {
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
        
        let messageLabel = UILabel(frame: CGRect(x: 10, y: 60, width: alertView.frame.size.width, height: 130))
        
        messageLabel.numberOfLines = 0
        messageLabel.text = message
        messageLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        messageLabel.textColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        messageLabel.textAlignment = .left
        alertView.addSubview(messageLabel)
        
        let button =  UIButton(frame: CGRect(x: 20, y: alertView.frame.size.height-70, width: alertView.frame.size.width-40, height: 50))
        button.setTitle("إخفاء", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.9411765933, green: 0.9411765337, blue: 0.9411766529, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.backgroundColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        button.layer.cornerRadius = 25
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
