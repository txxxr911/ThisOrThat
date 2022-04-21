//
//  RulesCustomCell.swift
//  WhoIsMost
//
//  Created by Victor on 14.04.2022.
//

import UIKit

class RulesCustomCell: UITableViewCell {
    var card = UIView()
    
    static let identifier = "CustomCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        card = UIView()
        contentView.addSubview(card)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) hasn't been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        card.layer.cornerRadius = 10
        contentView.addSubview(card)
        card.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }

}
