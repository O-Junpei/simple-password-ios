import UIKit
import Firebase

class SignUpViewController: UIViewController {

    private var passwordTextField: UITextField!
    private var passwordConfirmTextField: UITextField!
    
    
    private var uid: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        // UITextFieldの作成
        passwordTextField = UITextField()
        passwordTextField.frame = CGRect(x: 50, y: 100, width: 200, height: 50)
        passwordTextField.text = "myTextField"
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.clearButtonMode = .whileEditing
        view.addSubview(passwordTextField)
        
        passwordConfirmTextField = UITextField()
        passwordConfirmTextField.frame = CGRect(x: 50, y: 200, width: 200, height: 50)
        passwordConfirmTextField.text = "myTextField"
        passwordConfirmTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordConfirmTextField.clearButtonMode = .whileEditing
        view.addSubview(passwordConfirmTextField)
        
        
        //ボタンの生成
        let basicButton = UIButton()
        basicButton.frame = CGRect(x: 150, y: 300, width: 200, height: 40)
        basicButton.backgroundColor = UIColor.gray
        basicButton.addTarget(self, action: #selector(basicButtonClicked(sender:)), for:.touchUpInside)
        basicButton.setTitle("ボタンだよ", for: UIControl.State.normal)
        basicButton.setTitle("押された時", for: UIControl.State.highlighted)
        basicButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.addSubview(basicButton)
        
        
        if let user = Auth.auth().currentUser {
            uid = user.uid
        }
    }
    
    //basicボタンが押されたら呼ばれます
    @objc func basicButtonClicked(sender: UIButton){

        guard let password = passwordTextField.text, !password.isEmpty else {
            showMessage(message: "なんか入力してください")
            return
        }
        
        guard let passwordConfirm = passwordConfirmTextField.text,  !passwordConfirm.isEmpty else {
            showMessage(message: "なんか入力してください")
            return
        }
        
        guard password == passwordConfirm else {
            showMessage(message: "一致していません")
            return
        }
        
        // で登録しますがよろしいですか？
        
        //UIAlertControllerを用意する
        let actionAlert = UIAlertController(title: "新規登録", message: "登録しますがよろしいですか？", preferredStyle: UIAlertController.Style.alert)
        
        //UIAlertControllerにカビゴンのアクションを追加する
        let kabigonAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {
            (action: UIAlertAction!) in
            // 登録
            
            guard let uid = self.uid else {
                self.showMessage(message: "あれあれあれあれ")
                return
            }
            
            UserHandler.signUpUser(uid: uid, password: password, completion: { (error) in
                if (error == nil) {
                    self.showMessage(message: "登録失敗")
                }
                self.showMessage(message: "登録完了！")
            })
            
            
        })
        actionAlert.addAction(kabigonAction)
        
        //UIAlertControllerにキャンセルのアクションを追加する
        let cancelAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler: {
            (action: UIAlertAction!) in
            print("キャンセルのシートが押されました。")
        })
        actionAlert.addAction(cancelAction)
        
        //アクションを表示する
        present(actionAlert, animated: true, completion: nil)
        
    }
}

