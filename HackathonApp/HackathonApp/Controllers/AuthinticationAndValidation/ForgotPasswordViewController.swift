

import UIKit
import Firebase
class ForgotPasswordViewController: UIViewController {
    let customAlert = ForgotAlert()
    let resetButton = UIButton()
    let emailTextField = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //MARK: - EmailTextField
        emailTextField.placeholder = "البريد الإلكتروني"
        emailTextField.autocapitalizationType = .none
        emailTextField.placeholderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        emailTextField.customTextfield()
        emailTextField.textAlignment = .right
        emailTextField.textContentType = .emailAddress
        emailTextField.frame = CGRect(x: 20, y: 220, width: view.frame.width - 40, height: 34)
        view.addSubview(emailTextField)
        
        //MARK: - ResetPasswordButton
        resetButton.setTitle( "إعادة تعيين كلمة المرور" , for: .normal)
        resetButton.setTitleColor(#colorLiteral(red: 0.9411765933, green: 0.9411765337, blue: 0.9411766529, alpha: 1), for: .normal)
        resetButton.backgroundColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        resetButton.layer.cornerRadius = 15
        resetButton.frame = CGRect(x: 20, y: 300, width: view.frame.width - 40, height: 34)
        resetButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        resetButton.addTarget(self, action: #selector(resetLink), for: .touchUpInside)
        resetButton.createShadowButton()
        view.addSubview(resetButton)
    }
    
    @objc func resetLink() {
        Auth.auth().sendPasswordReset(withEmail: emailTextField.text!) { error in
            
            if error == nil {
                self.customAlert.showAlert(with: "تنبيه", message: "تم إرسال رابط إعادة التعيين", on: self)
            }
            
        }
    }
    
    @objc func dismissAlert() {
        customAlert.dismissAlert()
    }

}


class ForgotAlert {
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
        
        let messageLabel = UILabel(frame: CGRect(x: -10, y: 60, width: alertView.frame.size.width, height: 130))
        
        messageLabel.numberOfLines = 0
        messageLabel.text = message
        messageLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        messageLabel.textColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        messageLabel.textAlignment = .right
        alertView.addSubview(messageLabel)
        
        let button =  UIButton(frame: CGRect(x: 20, y: alertView.frame.size.height-70, width: alertView.frame.size.width-40, height: 50))
        button.setTitle("حسنًا", for: .normal)
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
