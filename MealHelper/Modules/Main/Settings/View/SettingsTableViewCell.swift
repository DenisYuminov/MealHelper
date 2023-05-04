//
//  SettingsTableViewCell.swift
//  MealHelper
//
//  Created by macbook Denis on 5/4/23.
//

import UIKit
import SnapKit

class SettingsTableViewCell: UITableViewCell {
    
    let leftLabel = UILabel()
    let rightLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(leftLabel)
        leftLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        contentView.addSubview(rightLabel)
        rightLabel.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
