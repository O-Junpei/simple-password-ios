import UIKit
import Firebase
import FirebaseAuth
import CryptoSwift

class TopViewController: UIViewController {
    
    let uid: String
    let encryptedUid: String
    
    private var passwordTextField: UITextField!
    private var loginButton: UIButton!
    private var googleLogoutButton: UIButton!
    
    init(uid: String, encryptedUid: String) {
        self.uid = uid
        self.encryptedUid = encryptedUid
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        passwordTextField = UITextField()
        passwordTextField.frame = CGRect(x: 100, y: 150, width: 200, height: 50)
        passwordTextField.text = "myTextField"
        passwordTextField.delegate = self
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.clearButtonMode = .whileEditing
        view.addSubview(passwordTextField)
        
        loginButton = UIButton()
        loginButton.frame = CGRect(x: 100, y: 250, width: 200, height: 40)
        loginButton.backgroundColor = UIColor.gray
        loginButton.addTarget(self, action: #selector(loginButtonOnTap), for:.touchUpInside)
        loginButton.setTitle("ログイン", for: UIControl.State.normal)
        loginButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.addSubview(loginButton)
        
        // ログアウトボタン
        googleLogoutButton = UIButton()
        googleLogoutButton.frame = CGRect(x: 100, y: 350, width: 200, height: 40)
        googleLogoutButton.backgroundColor = UIColor.gray
        googleLogoutButton.addTarget(self, action: #selector(googleLogoutButtonOnTap), for:.touchUpInside)
        googleLogoutButton.setTitle("グーグルログアウト", for: UIControl.State.normal)
        googleLogoutButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.addSubview(googleLogoutButton)
        
        
        
        UserHandler.signUpUser(uid: uid, password: "passwordpasswordpasswordpassword") { (error) in
        

        }

    }

    @objc func loginButtonOnTap(){
        print("loginButtonOnTap")
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showMessage(message: "パスワードが空です")
            return
        }
        
        UserHandler.fetchUser(uid: uid) { (user, error) in
            guard let encryptedUid = user?.encryptedUid else {
                self.showMessage(message: "暗号化されたuid 取得できませんでした")
                return
            }
            
            let adad = "password"
            let str = adad + adad + adad + adad + adad
            let key = String(str.prefix(32))
            
            
            guard let aaaaa = EncryptionUtil.decrypt(key: "passwordpasswordpasswordpassword", iv: "dammy", base64: encryptedUid) else {
                self.showMessage(message: "複合できませんんで下")
                return
            }
            
            guard aaaaa == self.uid else {
                self.showMessage(message: "一致しません！！")
                return
            }
            self.showMessage(message: "一致しまそた！！")
        }
        
        
        


        
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.fade
//        navigationController?.view.layer.add(transition, forKey: nil)
//        let passwordListViewController = PasswordListViewController()
//        navigationController?.setViewControllers([passwordListViewController], animated: false)
    }
    
    
    @objc func googleLogoutButtonOnTap(){
        print("googleLogoutButton")

        do {
            try Auth.auth().signOut()
           
            // Fade Animation
            let transition = CATransition()
            transition.duration = 0.5
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.fade
            navigationController?.view.layer.add(transition, forKey: nil)
            let googleLoginViewController = GoogleLoginViewController()
            navigationController?.setViewControllers([googleLoginViewController], animated: false)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}



extension TopViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing: \(textField.text!)")
    }
    
    //UITextFieldが編集された後に呼ばれる
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing: \(textField.text!)")
    }
    
    //改行ボタンが押された際に呼ばれる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn \(textField.text!)")
        
        // 改行ボタンが押されたらKeyboardを閉じる処理.
        textField.resignFirstResponder()
        
        return true
    }
    

}
