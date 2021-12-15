
import UIKit
import Firebase
class ViewController: UIViewController {
    
    //MARK: - Properties
    let appName = UILabel()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let showPasswordButton = UIButton()
    let forgotPasswordButton = UIButton()
    let loginButton = UIButton()
    let lineView = UIView()
    let signUpLabel = UILabel()
    let signUpButton = UIButton()
    let imageD = UIImageView()
    let title1 = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        hideKeyboardWhenTappedAround()
        //
        title1.text = "« إن قامت الساعة وفي يد أحدكم فسيلة، فإن استطاع أن لا يقوم حتى يغرسها فليغرسها » "
        title1.numberOfLines = 3
        title1.textColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        title1.textAlignment = .center
        title1.frame = CGRect(x: 28, y: 100, width: 350, height: 150)
        title1.font = .systemFont(ofSize: 25, weight: .semibold)
        view.addSubview(title1)
        //MARK: - EmailTextField
        emailTextField.placeholder = "الايميل"
        emailTextField.textAlignment = .right
        emailTextField.borderStyle = .roundedRect
        emailTextField.textContentType = .emailAddress
        emailTextField.frame = CGRect(x: 20, y: 250, width: 350, height: 34)
        view.addSubview(emailTextField)
        //MARK: - PasswordTextField
        passwordTextField.placeholder = "كلمة السر"
        passwordTextField.textAlignment = .right
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.frame = CGRect(x: 20, y: 300, width: 350, height: 34)
        view.addSubview(passwordTextField)
        //MARK: - HidePasswordButton
        showPasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        showPasswordButton.tintColor = .gray
        showPasswordButton.frame = CGRect(x: 20, y: 287, width: 60, height: 60)
        showPasswordButton.addTarget(self, action: #selector(hidePassword), for: .touchUpInside)
        view.addSubview(showPasswordButton)
        //MARK: - ForgotPasswordButton
        forgotPasswordButton.setTitle("نسيت كلمة السر ؟", for: .normal)
        forgotPasswordButton.setTitleColor(UIColor(#colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)), for: .normal)
        forgotPasswordButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        forgotPasswordButton.frame = CGRect(x: 225, y: 340, width: 170, height: 40)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPassword), for: .touchUpInside)
        view.addSubview(forgotPasswordButton)
        //MARK: - LoginButton
        loginButton.setTitle("تسجيل الدخول", for: .normal)
        loginButton.backgroundColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        loginButton.setTitleColor(UIColor (#colorLiteral(red: 0.9411765933, green: 0.9411765337, blue: 0.9411766529, alpha: 1)), for: .normal)
        loginButton.layer.cornerRadius = 15
        loginButton.frame = CGRect(x: 20, y: 400, width: 350, height: 34)
        loginButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        view.addSubview(loginButton)
        //MARK: - SeparatorLine
        lineView.backgroundColor = #colorLiteral(red: 0.9411765933, green: 0.9411765337, blue: 0.9411766529, alpha: 1)
        lineView.frame = CGRect(x: 0 , y: 750, width: view.frame.size.width, height: 3)
        view.addSubview(lineView)
        //MARK: - SignUpLabel
        signUpLabel.text = "ليس لديك حساب ؟"
        signUpLabel.font = .systemFont(ofSize: 17, weight: .regular)
        signUpLabel.frame = CGRect(x: 110, y: 750, width: 300, height: 60)
        signUpLabel.textAlignment = .center
        view.addSubview(signUpLabel)
        //MARK: - SignUpButton
        signUpButton.setTitle("انشاء حساب", for: .normal)
//        signUpButton.backgroundColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        signUpButton.setTitleColor(UIColor (#colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)), for: .normal)
        signUpButton.layer.cornerRadius = 15
        signUpButton.frame = CGRect(x: 60, y: 763, width: 150, height: 34)
        signUpButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        view.addSubview(signUpButton)
        //
        imageD.image = UIImage(named: "p3")
        imageD.frame = CGRect(x: 80, y: 500 , width: 250, height: 250)
        imageD.contentMode = .scaleAspectFill
        view.addSubview(imageD)
    }
    //MARK: - Methods
    @objc func hidePassword() {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc func forgotPassword() {
        
        //        let vc = ForgotPassVC()
        //        present(vc, animated: true, completion: nil)
    }
    
    @objc func login() {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) {  authResult, error in
            
            if error == nil {
                
                let tabBarVC = UITabBarController()
                let vc1 = UINavigationController(rootViewController: HomeViewController())
                let vc2 = UINavigationController(rootViewController: CommunitiesViewController())
                let vc3 = UINavigationController(rootViewController: ContnetViewController())
                let vc4 = UINavigationController(rootViewController: ProfileViewController())
               
                
               
                
                vc1.title = "الملف الشخصي"
                vc2.title = "المجتمعات"
                vc3.title = "المحتوى"
                vc4.title = "الرئيسية"
              
            
             
                tabBarVC.setViewControllers([vc1,vc2,vc3,vc4], animated: true)


                
                guard let items = tabBarVC.tabBar.items else {return}
                
                let images = ["person.crop.circle","person.3","note.text","house" ]
                
                for i in 0..<items.count {
                    items[i].image = UIImage(systemName: images[i])
                }
                
                tabBarVC.tabBar.backgroundColor = .white
                tabBarVC.tabBar.tintColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
                tabBarVC.modalPresentationStyle = .fullScreen
                self.present(tabBarVC, animated: true, completion: nil)
                
                
            } else {
                print(error!.localizedDescription)
            }
            
        }
    }
    
    @objc func signUp() {
        
        let vc = SignUpViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
} // end of class

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

