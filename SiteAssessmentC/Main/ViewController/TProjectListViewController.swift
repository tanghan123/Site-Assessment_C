//
//  TProjectListViewController.swift
//  Site_Assessment_C
//
//  Created by Jacob on 2018/9/11.
//  Copyright © 2018年 Jacob. All rights reserved.
//

import UIKit

class TProjectListViewController: TBaseViewController {

    @IBOutlet weak var nickName: PaddingLable!
    @IBOutlet weak var tableView: UITableView!
    var dataSoure:Array<String> = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        congifureSubView()
    }

    @IBAction func add(_ sender: Any) {
        performSegue(withIdentifier: "newProject", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //   实现通知监听方法
    @objc func loginSuccess(){
        if AppPreferencse.shared.isLogin {
            nickName.text = "Signed in as \(AppPreferencse.shared.user?.profile.name ?? "")"
        }else{
            nickName.text = "Not logged in"
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name(KLoginSuccess), object: nil)
    }

}
// MARK: 初始化
extension TProjectListViewController 
{
    func congifureSubView() {
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.clear
        
        // 通知

        NotificationCenter.default.addObserver(self, selector: #selector(loginSuccess), name: NSNotification.Name(rawValue:KLoginSuccess), object: nil)
    }
}

extension TProjectListViewController :UITableViewDelegate , UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TProjectListTableviewCell", for: indexPath) as! TProjectListTableviewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView();
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
}
