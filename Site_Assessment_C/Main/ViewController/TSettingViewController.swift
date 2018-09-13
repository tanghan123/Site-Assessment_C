//
//  TSettingViewController.swift
//  Site_Assessment_C
//
//  Created by Jacob on 2018/9/13.
//  Copyright © 2018年 Jacob. All rights reserved.
//

import UIKit
 

class TSettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func back(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
