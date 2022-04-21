//
//  CustomCell.swift
//  WhoIsMost
//
//  Created by Victor on 12.04.2022.
//

import Foundation
import UIKit

class CatalogCustomCell: UITableViewCell {
    var card = UIView()
    
    static let identifier = "CustomCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        card = UIView()
        contentView.addSubview(card)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        card.layer.cornerRadius = 11
        contentView.addSubview(card)
        card.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
