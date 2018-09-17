//
//  TSettingViewController.swift
//  Site_Assessment_C
//
//  Created by Jacob on 2018/9/13.
//  Copyright © 2018年 Jacob. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase



class TSettingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:K33Color]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        congifure()
        
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
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = HexColor(0xececec)
    }
}

extension TSettingViewController :UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TSettingTableViewCell", for: indexPath) 
        
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if AppPreferencse.shared.isLogin {
            THTool.alert(title: "Prompt",
                         message: "Whether to log out",
                         confirm: "confirm", cannel: "cannel", selfVC: self) { type in
                            switch type {
                            case .defualt: 
                                GIDSignIn.sharedInstance().signOut()
                                AppPreferencse.shared.isLogin = false;
                                break
                            case .cannel:
                                break
                            } 
            }
            
        }else{
            GIDSignIn.sharedInstance().signIn()
        }
        
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
            AppPreferencse.shared.isLogin = true;
            AppPreferencse.shared.user = user;
            NotificationCenter.default.post(name: NSNotification.Name(KLoginSuccess), object: nil)
        }
    }
    
    
}
