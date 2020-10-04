//
//  ProfileInfoCell.swift
//  CowrywiseClone
//
//  Created by Tim on 02/10/2020.
//

import UIKit

class ProfileInfoCell: UITableViewCell {
    
  var tableviewData : TableViewData? {
    
     didSet {
        leftAlignedLabel.text = tableviewData?.leftAlignedText
        rightAlignedLabel.text = tableviewData?.rightAlignedText
    }
    
}
    
    let leftAlignedLabel : UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.3764705882, green: 0.3882352941, blue: 0.4509803922, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
    
    let rightAlignedLabel : UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.7137254902, green: 0.7058823529, blue: 0.7490196078, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(leftAlignedLabel)
        addSubview(rightAlignedLabel)
        
        leftAlignedLabel.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 25, leftConstant: 25, bottomConstant: 25, rightConstant: 0)
        rightAlignedLabel.anchorWithConstantsToTop(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 25, leftConstant: 0, bottomConstant: 25, rightConstant: 25)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
