
import UIKit

class AddPasswordViewController: UIViewController {

    // tableview instance
    private var tableView: UITableView!
    
    // Array to display tableview
    private var items: [String] = []
    
    // Sectionで使用する配列を定義する.
    private let sections: Array = ["セクション0", "セクション1", "セクション2"]
    
    //
    private var passwordIconName = ""
    private var passwordName = ""
    private var elements: [String] = []
    private let images: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let rightNavigationButton = UIBarButtonItem(title: "保存", style: .plain, target: self, action: #selector(rightBarBtnClicked))
        navigationItem.rightBarButtonItem = rightNavigationButton

        let leftNavigationButton =  UIBarButtonItem(title: "閉じる", style: .plain,  target: self, action: #selector(leftBarBtnClicked))
        navigationItem.leftBarButtonItem = leftNavigationButton
        
        
        items = ["Apple", "Water melon", "Peach", "Cherry", "Grapes", "pear"]
        
        // initialize tableview
        tableView = UITableView.init(frame: CGRect.zero, style: .grouped)
        
        // set delegate
        tableView.delegate = self
        tableView.dataSource = self
        
        // set tableview size
        tableView.frame = view.frame
        
        // set tableview
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        view.addSubview(tableView)
    }

    @objc func rightBarBtnClicked(sender: UIButton){
        print("rightBarBtnClicked")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func leftBarBtnClicked(sender: UIButton){
        print("rightBaleftBarBtnClickedrBtnClicked")
    
        self.dismiss(animated: true, completion: nil)
    }
}

extension AddPasswordViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // セクションのタイトルを返す
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    // set the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            // icon, password name
            return 2
        } else if section == 1 {
            // elements, add
            return elements.count + 1
        } else {
            // images, add
            return images.count + 1
        }
    }
    
    // set tableview rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))! as UITableViewCell
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "アイコン"
                cell.textLabel?.numberOfLines = 1
                return cell
            } else if indexPath.row == 1 {
                if passwordName.isEmpty {
                    cell.textLabel?.text = "パスワード名"
                } else {
                    cell.textLabel?.text = "パスワード名" + "\n" + passwordName
                }
                cell.textLabel?.numberOfLines = 0
                return cell
            }
        } else if indexPath.section == 1 {
            if elements.count == indexPath.row {
                // last cell
                cell.textLabel?.text = "新しい項目を追加"
                cell.textLabel?.textAlignment = .center
                cell.textLabel?.numberOfLines = 0
            } else {
                cell.textLabel?.text = elements[indexPath.row]
                cell.textLabel?.textAlignment = .left
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "画像を追加"
                cell.textLabel?.textAlignment = .center
            }
        }
        
        return cell
    }
    
    // called when tableview cell was tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                // select icon
            } else {
                // input password name
                
                
                //UIAlertControllerを用意する
                let actionAlert = UIAlertController(title: "入力", message: "好きなポケモンを入力してください", preferredStyle: UIAlertController.Style.alert)
                
                //UIAlertControllerにアクションを追加する
                let kabigonAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                    (action: UIAlertAction!) in
                    
                    // TODO: refactor
                    let textFields:Array<UITextField>? =  actionAlert.textFields as Array<UITextField>?
                    if textFields != nil {
                        for textField:UITextField in textFields! {
                            //TextFieldの.textにアクセス
                            print(textField.text ?? "error")
                            
                            if let text = textField.text {
                                self.passwordName = text
                                self.tableView.reloadData()
                            }
                            
                            
                        }
                    }
                })
                actionAlert.addAction(kabigonAction)
                
                //UIAlertControllerにキャンセルのアクションを追加する
                let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
                actionAlert.addAction(cancelAction)
                
                //UIAlertControllerにTextFieldを追加する
                actionAlert.addTextField(configurationHandler: {(text:UITextField!) -> Void in
                    
                    text.placeholder = "What is your favorite pokemon?"
                })
                
                //アクションを表示する
                self.present(actionAlert, animated: true, completion: nil)
                
            }
        } else if indexPath.section == 1 {
            if elements.count == indexPath.row {
                // last cell
                print("Last Cell")
                elements.append("ID \n mofumofuchan1")
                tableView.reloadData()
            }
        }
    }
}
