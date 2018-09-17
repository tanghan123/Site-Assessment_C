//
//  PaddingLable.swift
//  SiteAssessmentC
//
//  Created by Jacob on 2018/9/16.
//  Copyright © 2018年 Jacob. All rights reserved.
//

import UIKit

class PaddingLable: UILabel {
    var edgeinsets:UIEdgeInsets = UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, edgeinsets))
    }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insets  = edgeinsets
        var rect  = super.textRect(forBounds: UIEdgeInsetsInsetRect(bounds, insets), limitedToNumberOfLines: numberOfLines)
        rect.origin.x -= insets.left
        rect.origin.y -= insets.top
        rect.size.width += (insets.left + insets.right)
        rect.size.height += (insets.top + insets.bottom)
        
        return rect
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
