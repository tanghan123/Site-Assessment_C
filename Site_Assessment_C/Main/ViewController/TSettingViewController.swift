//
//  TSettingViewController.swift
//  Site_Assessment_C
//
//  Created by Jacob on 2018/9/13.
//  Copyright © 2018年 Jacob. All rights reserved.
//

import UIKit
import GoogleSignIn
 

class TSettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       // congifure()
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

extension TSettingViewController
{
    fileprivate func congifure() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().scopes = [kGTLRAuthScopeDriveFile]
        GIDSignIn.sharedInstance().shouldFetchBasicProfile = true
        GIDSignIn.sharedInstance().signInSilently()
        let Signbtn = GIDSignInButton(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        Signbtn.center = view.center
        view.addSubview(Signbtn)
    }
}

extension TSettingViewController: GIDSignInUIDelegate , GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            //service.authorizer = nil
            print("Sign error:\(error)")
            return
        } else {
            //ViewController.user = user
            print("didSignInFor")
        }
    }
}
