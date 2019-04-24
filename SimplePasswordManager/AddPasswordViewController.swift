
import UIKit

class AddPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let leftNavigationButton =  UIBarButtonItem(barButtonSystemItem:  .add, target: self, action: #selector(leftBarBtnClicked))
        navigationItem.leftBarButtonItem = leftNavigationButton
    }

    
    @objc func leftBarBtnClicked(sender: UIButton){
        print("rightBarBtnClicked")
    
        self.dismiss(animated: true, completion: nil)
    }
}
