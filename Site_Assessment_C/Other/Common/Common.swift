//
//  Common.swift
//  Site_Assessment_C
//
//  Created by Jacob on 2018/9/11.
//  Copyright © 2018年 Jacob. All rights reserved.
//

import Foundation
import UIKit

// 屏幕宽
let KScreenWidth = UIScreen.main.bounds.size.width;
// 屏幕高
let KScreenHeight = UIScreen.main.bounds.size.height;


/// 16进制转颜色
///
/// - Parameter rgbValue: 16进制数
/// - Returns: 颜色
func HexColor(_ rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0))
}
// 蓝色
let KBlueColor = HexColor(0x0D71BA)
// 绿色
let KGreenColor = HexColor(0x99C34E)

// 字体
let KFont = "helvetica neue"



