import UIKit

class PasswordDetailViewController: UIViewController {

    private var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        // initialize tableview
        tableView = UITableView()
        
        // set delegate
        tableView.delegate = self
        tableView.dataSource = self
        
        // set tableview size
        tableView.frame = view.frame
        
        // set tableview
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        
        tableView.rowHeight = 80
        view.addSubview(tableView)
    }
}


extension PasswordDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) cell was selected")
        navigationController?.pushViewController(PasswordDetailViewController(), animated: true)
    }
}
