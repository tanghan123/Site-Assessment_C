//
//  TBaseViewController.swift
//  Site_Assessment_C
//
//  Created by Jacob on 2018/9/11.
//  Copyright © 2018年 Jacob. All rights reserved.
//

import UIKit

class TBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TBaseViewController
{
    fileprivate func setup() {
        let bgImg :UIImageView = UIImageView(frame:view.bounds);
        bgImg.image = UIImage(named: "bg_img")
        view.addSubview(bgImg)
        view.sendSubview(toBack: bgImg);
    }
    
    
}
