import UIKit
import Firebase

class RouterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white


        if let user = Auth.auth().currentUser {
            // User is signed in

            UserHandler.fetchUser(uid: user.uid) { (user, error) in
                if let error = error {
                    print(error)
                    // need googleLogin
                    self.goGoogleLoginViewController()
                    return
                }

                guard let user = user else {
                    // user is nil
                    // need googleLogin
                    self.goGoogleLoginViewController()
                    return
                }

                guard let encryptedUid = user.encryptedUid else {
                    // sign up
                    self.goSignUpViewController()
                    return
                }

                self.goTopViewController(uid: user.uid, encryptedUid: encryptedUid)
            }
        }
    }
    
    // GoogleLoginViewController
    func goGoogleLoginViewController() {
        let googleLoginViewController = GoogleLoginViewController()
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        navigationController?.view.layer.add(transition, forKey: nil)
        navigationController?.setViewControllers([googleLoginViewController], animated: false)
    }
    
    // GoogleLoginViewController
    func goSignUpViewController() {
        let signUpViewController = SignUpViewController()
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        navigationController?.view.layer.add(transition, forKey: nil)
        navigationController?.setViewControllers([signUpViewController], animated: false)
    }
    
    // TopViewController
    func goTopViewController(uid: String, encryptedUid: String) {
        let topViewController = TopViewController(uid: uid, encryptedUid: encryptedUid)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        navigationController?.view.layer.add(transition, forKey: nil)
        navigationController?.setViewControllers([topViewController], animated: false)
    }
}
