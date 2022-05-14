//
//  CustomCell.swift
//  WhoIsMost
//
//  Created by Victor on 12.04.2022.
//

import Foundation
import UIKit

class CatalogCustomCell: UITableViewCell {
    
    private let background = UIImageView()
    private let cardIcon = UIImageView()
    private let cardNameLabel = UILabel()
    private let cardDescription = UILabel()
    private let taskCount = UILabel()
    private let shadowButton = UIImageView()
    private let conditionLabel = UILabel()
    private let conditionButton = UIButton()
    private let buyButton = UIButton()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    fileprivate func layout() {
        layoutBackground()
        layoutCardIcon()
        layoutCardName()
        layoutCardDescription()
        layoutTaskCount()
        layoutButtonShadow()
        layoutConditionLabel()
        layoutConditionButton()
        layoutBuyButton()
    }
    
    fileprivate func layoutBackground() {
        contentView.addSubview(background)
        
        background.snp.makeConstraints { make in
            make.width.equalTo(339)
            make.height.equalTo(154)
            make.centerX.equalToSuperview()
        }
    }
    
    fileprivate func layoutCardIcon() {
        contentView.addSubview(cardIcon)
        
        cardIcon.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.top.equalTo(background).inset(20)
            make.left.equalTo(background).inset(13)
        }
    }
    
    fileprivate func layoutCardName() {
        contentView.addSubview(cardNameLabel)
        
        cardNameLabel.snp.makeConstraints { make in
            make.width.equalTo(162)
            make.height.equalTo(38)
            make.top.equalTo(background).inset(10)
            make.left.equalTo(background).inset(123.1)
        }
    }
    
    fileprivate func layoutCardDescription() {
        contentView.addSubview(cardDescription)
        
        cardDescription.snp.makeConstraints { make in
            make.width.equalTo(215)
            make.height.equalTo(45)
            make.top.equalTo(background).inset(54)
            make.left.equalTo(background).inset(123.1)
        }
    }
    
    fileprivate func layoutTaskCount() {
        contentView.addSubview(taskCount)
        
        taskCount.snp.makeConstraints { make in
            make.width.equalTo(189)
            make.height.equalTo(38)
            make.top.equalTo(background).inset(111)
            make.left.equalTo(background).inset(123)
        }
    }
    
    fileprivate func layoutBuyButton() {
        contentView.addSubview(buyButton)
        
        
    }
    
    fileprivate func layoutButtonShadow() {
        contentView.addSubview(shadowButton)
        
        shadowButton.snp.makeConstraints { make in
            make.width.equalTo(92)
            make.height.equalTo(32)
            make.top.equalTo(background).inset(111)
            make.left.equalTo(background).inset(236)
        }
    }
    
    fileprivate func layoutConditionLabel() {
        contentView.addSubview(conditionLabel)
        
        conditionLabel.snp.makeConstraints { make in
            make.width.equalTo(107)
            make.height.equalTo(38)
            make.top.equalTo(background).inset(111)
            make.left.equalTo(background).inset(231)
        }
    }
    
    fileprivate func layoutConditionButton() {
        
    }
    
    func setup(item: CardSet) -> CatalogCustomCell {
        
        background.image = UIImage(named: item.image)
        
        
        cardNameLabel.text = item.title
        cardNameLabel.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 24)
        cardNameLabel.textColor = .white
        cardNameLabel.textAlignment = .left
        
        
        cardIcon.image = UIImage(named: item.icon)
        
        
        cardDescription.text = item.description
        cardDescription.font = UIFont(name: "YanoneKaffeesatz-Regular", size: 16)
        cardDescription.textColor = .white
        cardDescription.textAlignment = .left
        cardDescription.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1
        cardDescription.attributedText = NSMutableAttributedString(string: "\(item.description)", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        
        shadowButton.image = UIImage(named: "buy_shadow")
        
        
        conditionLabel.text = "Выключить"
        conditionLabel.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 18)
        conditionLabel.textColor = .white
        conditionLabel.textAlignment = .center
        conditionLabel.numberOfLines = 0
        
        taskCount.text = item.tasksCount
        taskCount.font = UIFont(name:  "YanoneKaffeesatz-Regular", size: 14)
        taskCount.textColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        taskCount.textAlignment = .left
        taskCount.numberOfLines = 0
        
        return self
    }
    
}
