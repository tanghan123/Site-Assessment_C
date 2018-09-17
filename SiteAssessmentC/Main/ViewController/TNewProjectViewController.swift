//
//  TNewProjectViewController.swift
//  SiteAssessmentC
//
//  Created by Jacob on 2018/9/17.
//  Copyright © 2018年 Jacob. All rights reserved.
//

import UIKit
let KTHeaderView:String = "THeaderView"
let kWhetherTableViewCell:String = "WhetherTableViewCell"
class TNewProjectViewController: TBaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
     
    // 
    lazy var dataSoure: NSArray = {
        let plistpath  = Bundle.main.path(forResource: "QuestionsList", ofType: "plist")
        let arr: NSArray = NSArray(contentsOfFile: plistpath!)!
        var datasoure:NSMutableArray = NSMutableArray.init()
        datasoure = BaseModel.mj_objectArray(withKeyValuesArray: arr)
        return datasoure
    }() 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        congifureSubView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: congifure

extension TNewProjectViewController
{
    fileprivate func congifureSubView() {
        // 
        tableView.backgroundColor = UIColor.clear
        
        // 
        tableView.register(UINib.init(nibName: KTHeaderView, bundle: nil), forHeaderFooterViewReuseIdentifier: KTHeaderView)
        
        //
        self.tableView.register(UINib.init(nibName: kWhetherTableViewCell, bundle: nil), forCellReuseIdentifier: kWhetherTableViewCell)
    }
}

// MARK: 代理
extension TNewProjectViewController :UITableViewDataSource , UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSoure.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dto :BaseModel = dataSoure[section] as! BaseModel
        switch section {
        case 1:
            let model :QuestionModel = dto.questionList[0]
            
            return model.ridgeList.count + 1
        default:
            return dto.questionList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:WhetherTableViewCell = tableView.dequeueReusableCell(withIdentifier: kWhetherTableViewCell, for: indexPath) as! WhetherTableViewCell
        let dto :BaseModel = dataSoure[indexPath.section] as! BaseModel
        switch indexPath.section {
        case 1:
            let model :QuestionModel = dto.questionList[0]
            if indexPath.row == 0 {
                cell.title.text = model.name
            }else{
                let quest = model.ridgeList[indexPath.row - 1]
                cell.title.text = quest.name 
            }
        default:
            let model = dto.questionList[indexPath.row];
            cell.title.text = model.name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  head: THeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: KTHeaderView) as! THeaderView
        let dto :BaseModel = dataSoure[section] as! BaseModel
        head.title.text = dto.heading
        return head
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
}
