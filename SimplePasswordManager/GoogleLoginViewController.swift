import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class GoogleLoginViewController: UIViewController, GIDSignInUIDelegate {

    private var googleLoginButton: UIButton!
    private var handle: AuthStateDidChangeListenerHandle!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                // User is signed in
                self.goTopViewController()
            } else {
                // User is not signed in
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }

    @objc func googleLoginButtonOnTap(){
        print("googleLoginButtonOnTap")
        
        if Auth.auth().currentUser != nil {
            // User is signed in
            self.goTopViewController()
        } else {
            // User is not signed in
            GIDSignIn.sharedInstance().uiDelegate = self
            GIDSignIn.sharedInstance().signIn()
        }
    }
    
    func goTopViewController() {
//        let topViewController = TopViewController()
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.fade
//        navigationController?.view.layer.add(transition, forKey: nil)
//        navigationController?.setViewControllers([topViewController], animated: false)
    }
}
