

import UIKit
import Lottie

class LunchScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImageView()
        image.image = UIImage(named: "p0")
        image.frame = CGRect(x: 20, y: 100, width: 350, height: 100)
        image.contentMode = .scaleAspectFit
        view.addSubview(image)
        
        view.backgroundColor = .white
        configureAnimation()
    }
    func configureAnimation() {
        let animation = Animation.named("data")
        let animationView = AnimationView(animation:animation)
        animationView.contentMode = .scaleAspectFill
        animationView.frame = CGRect(x: 0, y: 0, width: 320, height: 320)
        animationView.center = view.center
        view.addSubview(animationView)
        animationView.play()
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        
        let vc = ViewController()
        vc.modalPresentationStyle = .fullScreen
        
        DispatchQueue.main.asyncAfter(deadline: .now()+5, execute:{
            self.present(vc, animated: true, completion: nil)
        })
    }
    
}
