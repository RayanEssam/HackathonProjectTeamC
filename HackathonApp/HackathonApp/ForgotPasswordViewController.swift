//
//  ForgotPasswordViewController.swift
//  HackathonApp
//
//  Created by Abdullah AlRashoudi on 12/17/21.
//

import UIKit
import Firebase
class ForgotPasswordViewController: UIViewController {
    
    let resetButton = UIButton()
    let emailTextField = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //MARK: - EmailTextField
        emailTextField.placeholder = "الإيميل"
        emailTextField.autocapitalizationType = .none
        emailTextField.placeholderColor = #colorLiteral(red: 0.6016606688, green: 0.849891603, blue: 0.5555105209, alpha: 1)
        emailTextField.customTextfield()
        emailTextField.textAlignment = .right
        emailTextField.textContentType = .emailAddress
        emailTextField.frame = CGRect(x: 20, y: 350, width: 350, height: 34)
        view.addSubview(emailTextField)
        
        //MARK: - ResetPasswordButton
        resetButton.setTitle("إعادة تعيين عبر الإيميل", for: .normal)
        resetButton.setTitleColor(#colorLiteral(red: 0.9411765933, green: 0.9411765337, blue: 0.9411766529, alpha: 1), for: .normal)
        resetButton.backgroundColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        resetButton.layer.cornerRadius = 15
        resetButton.frame = CGRect(x: 20, y: 400, width: 350, height: 34)
        resetButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        resetButton.addTarget(self, action: #selector(resetLink), for: .touchUpInside)
        view.addSubview(resetButton)
    }
    
    @objc func resetLink() {
        Auth.auth().sendPasswordReset(withEmail: emailTextField.text!) { error in
            
            if error == nil {
                
                let alert = UIAlertController(title: "تنبيه", message: "تم إرسال رابط إعادة التعيين", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "موافق", style: .default, handler: nil)
                
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                
                DispatchQueue.main.asyncAfter(deadline: .now()+3.0) {
                    
                    self.dismiss(animated: true, completion: nil)
                }
            }
            
        }
    }

}
