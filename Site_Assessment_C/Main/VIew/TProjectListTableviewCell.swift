//
//  TProjectListTableviewCell.swift
//  Site_Assessment_C
//
//  Created by Jacob on 2018/9/11.
//  Copyright © 2018年 Jacob. All rights reserved.
//

import UIKit

class TProjectListTableviewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
       accessoryType = .disclosureIndicator 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
