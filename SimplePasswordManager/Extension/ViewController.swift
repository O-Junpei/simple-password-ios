
import UIKit


extension UIViewController {
    
    func showMessage(message: String){
        //UIAlertControllerを用意する
        let actionAlert = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let cancelAction = UIAlertAction(title: "閉じる", style: UIAlertAction.Style.cancel, handler: nil)
        actionAlert.addAction(cancelAction)
        
        //アクションを表示する
        present(actionAlert, animated: true, completion: nil)
    }
}
