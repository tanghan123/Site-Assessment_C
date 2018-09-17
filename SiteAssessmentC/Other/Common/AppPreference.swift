//
//  AppPreference.swift
//  SiteAssessmentC
//
//  Created by Jacob on 2018/9/15.
//  Copyright © 2018年 Jacob. All rights reserved.
//

import UIKit
import GoogleSignIn

class AppPreferencse: NSObject {
    static let shared = AppPreferencse()
    private override init() {}
    
    /// 记录登录状态
    var isLogin:Bool = false
    
    /// 用户信息
    var user: GIDGoogleUser?
    
    
    override func copy() -> Any {
        return self // SingletonClass.shared
    }
    
    override func mutableCopy() -> Any {
        return self // SingletonClass.shared
    }
    
    // Optional
    func reset() {
        // Reset all properties to default value
    }
}
