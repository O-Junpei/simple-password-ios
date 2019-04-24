import UIKit

class PasswordListViewController: UIViewController {

    private var tableView: UITableView!

    // Array to display tableview

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let rightNavBtn =  UIBarButtonItem(barButtonSystemItem:  .add, target: self, action: #selector(rightBarBtnClicked))
        navigationItem.rightBarButtonItem = rightNavBtn

        // initialize tableview
        tableView = UITableView()

        // set delegate
        tableView.delegate = self
        tableView.dataSource = self

        // set tableview size
        tableView.frame = view.frame

        // set tableview
        tableView.register(CustumTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(CustumTableViewCell.self))

        tableView.rowHeight = 80
        
        view.addSubview(tableView)
    }

    @objc func rightBarBtnClicked(sender: UIButton){
        print("rightBarBtnClicked")
        let navigationController = UINavigationController(rootViewController: AddPasswordViewController())
        present(navigationController, animated: true)
    }


}


extension PasswordListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(CustumTableViewCell.self))! as! CustumTableViewCell
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) cell was selected")
        navigationController?.pushViewController(PasswordDetailViewController(), animated: true)
    }
}
