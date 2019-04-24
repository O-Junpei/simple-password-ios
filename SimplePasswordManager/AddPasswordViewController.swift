
import UIKit

class AddPasswordViewController: UIViewController {

    // tableview instance
    private var tableView: UITableView!
    
    // Array to display tableview
    private var items: [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let rightNavigationButton = UIBarButtonItem(title: "保存", style: .plain, target: self, action: #selector(rightBarBtnClicked))
        navigationItem.rightBarButtonItem = rightNavigationButton

        let leftNavigationButton =  UIBarButtonItem(title: "閉じる", style: .plain,  target: self, action: #selector(leftBarBtnClicked))
        navigationItem.leftBarButtonItem = leftNavigationButton
        
        
        items = ["Apple", "Water melon", "Peach", "Cherry", "Grapes", "pear"]
        
        // initialize tableview
        tableView = UITableView()
        
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
    // set the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // set tableview rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))! as UITableViewCell
        cell.textLabel?.text = self.items[indexPath.row]
        return cell
    }
    
    // called when tableview cell was tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) cell was selected")
    }
}
