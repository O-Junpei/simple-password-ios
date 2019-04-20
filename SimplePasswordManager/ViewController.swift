import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        // ログインが必要
        // ログインボタン
        //ボタンの生成
        let basicButton = UIButton()
        
        //ボタンの位置と大きさの指定
        //x:50,y:50の位置に横幅200:縦40のボタンを設置
        basicButton.frame = CGRect(x: 50, y: 50, width: 200, height: 40)
        
        //背景色の指定、灰色
        basicButton.backgroundColor = UIColor.gray
        
        //押された時のアクションを設定
        basicButton.addTarget(self, action: #selector(basicButtonClicked(sender:)), for:.touchUpInside)
        
        //ボタンのテキストを設定
        basicButton.setTitle("ボタンだよ", for: UIControl.State.normal)
        basicButton.setTitle("押された時", for: UIControl.State.highlighted)
        
        //テキストの色を指定
        basicButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        
        //Viewに配置
        self.view.addSubview(basicButton)
        
        // ログインしている場合
        // ログアウトボタン
    }

    //basicボタンが押されたら呼ばれます
    @objc func basicButtonClicked(sender: UIButton){
        print("basicButtonBtnClicked")
    }
}

