import UIKit

class GoogleLoginViewController: UIViewController {

    private var googleLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange

        // ログアウトボタン
        googleLoginButton = UIButton()
        googleLoginButton.frame = CGRect(x: 100, y: 350, width: 200, height: 40)
        googleLoginButton.backgroundColor = UIColor.gray
        googleLoginButton.addTarget(self, action: #selector(googleLoginButtonOnTap), for:.touchUpInside)
        googleLoginButton.setTitle("グーグルログイン", for: UIControl.State.normal)
        googleLoginButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.addSubview(googleLoginButton)
    }
    

    @objc func googleLoginButtonOnTap(){
        print("googleLoginButtonOnTap")
        
        // でぃそ
        let topViewController = TopViewController()
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        navigationController?.view.layer.add(transition, forKey: nil)
        navigationController?.setViewControllers([topViewController], animated: false)
    }

}
