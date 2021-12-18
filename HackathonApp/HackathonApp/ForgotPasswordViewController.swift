

import UIKit
import Firebase
class ForgotPasswordViewController: UIViewController {
    let customAlert = MyAlert()
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
