
import UIKit
import Firebase
class SignUpViewController: UIViewController {
    //MARK: - Properties
    let db = Firestore.firestore()
    let lineView = UIView()
    let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
    let pageName = UILabel()
    let title1 = UILabel()
    let nameTextField = UITextField()
    let idTextField = UITextField()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signUpButton = UIButton()
    let backButton = UIButton()
    let signInLabel = UILabel()
    let signInButton = UIButton()
    let imageD = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //MARK: - BackButton
        let largeBoldChevron = UIImage(systemName: "chevron.backward", withConfiguration: largeConfig)
        backButton.setImage(largeBoldChevron, for: .normal)
        backButton.frame = CGRect(x: 0, y: 50, width: 50, height: 50)
        backButton.tintColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        backButton.addTarget(self, action: #selector(dismissPage), for: .touchUpInside)
        view.addSubview(backButton)
        //MARK: - PageName
        pageName.text = "تسجيل الدخول"
        pageName.textColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        pageName.frame = CGRect(x: 40, y: 50, width: 310, height: 50)
        pageName.font = .systemFont(ofSize: 15, weight: .semibold)
        view.addSubview(pageName)
        //
        title1.text = "شاركنا .. لنغرسها"
        title1.textColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        title1.textAlignment = .center
        title1.frame = CGRect(x: 28, y: 150, width: 350, height: 50)
        title1.font = .systemFont(ofSize: 50, weight: .semibold)
        view.addSubview(title1)
        //MARK: - NameTextField
        nameTextField.placeholder = "الاسم"
        nameTextField.textAlignment = .right
        nameTextField.borderStyle = .roundedRect
        nameTextField.frame = CGRect(x: 20, y: 250, width: 350, height: 34)
        view.addSubview(nameTextField)

        //MARK: - IDTextField
        idTextField.placeholder = "رقم الهوية"
        idTextField.textAlignment = .right
        idTextField.borderStyle = .roundedRect
        idTextField.frame = CGRect(x: 20, y: 300, width: 350, height: 34)
        view.addSubview(idTextField)
        //MARK: - EmailTextField
        emailTextField.placeholder = " الايميل"
        emailTextField.textAlignment = .right
        emailTextField.autocapitalizationType = .none
        emailTextField.borderStyle = .roundedRect
        emailTextField.textContentType = .emailAddress
        emailTextField.frame = CGRect(x: 20, y: 350, width: 350, height: 34)
        view.addSubview(emailTextField)
        //MARK: - PasswordTextField
        passwordTextField.placeholder = " كلمة السر"
        passwordTextField.textAlignment = .right
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.frame = CGRect(x: 20, y: 400, width: 350, height: 34)
        view.addSubview(passwordTextField)
        //MARK: - SignUpButton
        signUpButton.setTitle("انشاء حساب", for: .normal)
        signUpButton.backgroundColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        signUpButton.setTitleColor(UIColor (#colorLiteral(red: 0.9411765933, green: 0.9411765337, blue: 0.9411766529, alpha: 1)), for: .normal)
        signUpButton.layer.cornerRadius = 15
        signUpButton.frame = CGRect(x: 20, y: 450, width: 350, height: 34)
        signUpButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        view.addSubview(signUpButton)
        //MARK: - SeparatorLine
        lineView.backgroundColor = #colorLiteral(red: 0.9411765933, green: 0.9411765337, blue: 0.9411766529, alpha: 1)
        lineView.frame = CGRect(x: 0 , y: 750, width: view.frame.size.width, height: 3)
        view.addSubview(lineView)
        //MARK: - SignInLabel
        signInLabel.text = "لديك حساب ؟"
        signInLabel.font = .systemFont(ofSize: 17, weight: .regular)
        signInLabel.frame = CGRect(x: 90, y: 750, width: 300, height: 60)
        signInLabel.textAlignment = .center
        view.addSubview(signInLabel)
        //MARK: - SignInButton
        signInButton.setTitle("تسجيل دخول", for: .normal)
        signInButton.setTitleColor(UIColor (#colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)), for: .normal)
        signInButton.layer.cornerRadius = 15
        signInButton.frame = CGRect(x: 60, y: 763, width: 150, height: 34)
        signInButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        view.addSubview(signInButton)
        //
        imageD.image = UIImage(named: "p5")
        imageD.frame = CGRect(x: 80, y: 500 , width: 250, height: 250)
        imageD.contentMode = .scaleAspectFill
        view.addSubview(imageD)
    }
    //MARK: - Methods
    @objc func signUp() {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
            
            if error == nil {
                
                self.db.collection("Users")
                   .addDocument(data:
                                   [
                                    "name" : "\(self.nameTextField.text!)",
                                       "id": "\(self.idTextField.text!)",
                                    "email": "\(self.emailTextField.text!)",
                                    "score" : 0,
                                    "numberOfTrees": 0
                                       
                                   ])
               { error in
                       if error == nil {
                           print("New document has been created...")
                       } else {
                           print("error\(error!.localizedDescription)")
                       }
                       
                   }
                let tabBarVC = TabBarViewController()
                self.present(tabBarVC, animated: true, completion: nil)
            } else {
                print(error!.localizedDescription)
            }
        }
        
    }
    
    @objc func dismissPage() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func signIn() {
        let vc = ViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
}
