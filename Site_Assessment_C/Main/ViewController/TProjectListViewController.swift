//
//  TProjectListViewController.swift
//  Site_Assessment_C
//
//  Created by Jacob on 2018/9/11.
//  Copyright © 2018年 Jacob. All rights reserved.
//

import UIKit

class TProjectListViewController: TBaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSoure:Array<String> = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        congifureSubView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
// MARK: 初始化
extension TProjectListViewController 
{
    func congifureSubView() {
        
    }
}

extension TProjectListViewController :UITableViewDelegate , UITableViewDataSource
{
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
}
