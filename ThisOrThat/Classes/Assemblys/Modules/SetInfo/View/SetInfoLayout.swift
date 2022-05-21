//
//  SetInfoLayout.swift
//  ThisOrThat
//
//  Created by Victor on 14.05.2022.
//

import Foundation
import UIKit

extension SetInfoViewController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func layout() {
        layoutBackground()
        layoutExampleSetView()
        layoutBuySetButton()
        layoutOrLabel()
        layoutPremium()
        layoutExampleSetName()
        layoutSetDescription()
        layoutPremiumLabel()
        layoutPremiumOnWeek()
        layoutPremiumOnMonth()
        layoutPremiumForever()
    }
    
    fileprivate func layoutBackground() {
        view.addSubview(backgroundImage)
        backgroundImage.image = UIImage(named: "background")
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate func layoutExampleSetView() {
        view.addSubview(exampleSetView)
        exampleSetView.image = UIImage(named: "exampleSetView")
        
        exampleSetView.snp.makeConstraints { make in
            make.width.equalTo(330)
            make.height.equalTo(231)
            make.centerX.equalToSuperview()
            make.top.equalTo(20)
        }
    }
    
    fileprivate func layoutOrLabel() {
        view.addSubview(orLabel)
        orLabel.text = "ИЛИ"
        orLabel.textColor = .white
        orLabel.textAlignment = .center
        orLabel.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 36)
        
        orLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(exampleSetView).inset(290)
        }
    }
    
    fileprivate func layoutPremium() {
        view.addSubview(premium)
        premium.image = UIImage(named: "premium")
        
        premium.snp.makeConstraints { make in
            make.width.equalTo(346)
            make.height.equalTo(300)
            make.centerX.equalToSuperview()
            make.top.equalTo(orLabel)
        }
    }
    
    fileprivate func layoutExampleSetName() {
        view.addSubview(exampleSetName)
        exampleSetName.text = ""
        exampleSetName.textColor = .white
        exampleSetName.textAlignment = .center
        exampleSetName.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 30)
        
        exampleSetName.snp.makeConstraints { make in
            make.width.equalTo(162)
            make.height.equalTo(38)
            make.centerX.equalToSuperview()
            make.top.equalTo(exampleSetView).inset(10)
        }
    }
    
    fileprivate func layoutPremiumLabel() {
        view.addSubview(premiumLabel)
        premiumLabel.text = "Премиум"
        premiumLabel.textColor = .white
        premiumLabel.textAlignment = .center
        premiumLabel.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 30)
        
        premiumLabel.snp.makeConstraints { make in
            make.width.equalTo(162)
            make.height.equalTo(38)
            make.centerX.equalToSuperview()
            make.top.equalTo(premium).inset(75)
        }
    }
    
    fileprivate func layoutBuySetButton() {
        view.addSubview(buySetButton)
        buySetButton.setImage(UIImage(named: "buySetButton"), for: .normal)
        
        buySetButton.snp.makeConstraints { make in
            make.width.equalTo(163)
            make.height.equalTo(46)
            make.left.equalTo(exampleSetView).inset(154)
            make.top.equalTo(exampleSetView).inset(169)
        }
    }
    
    fileprivate func layoutPremiumOnWeek() {
        view.addSubview(premiumOnWeek)
        premiumOnWeek.setImage(UIImage(named: "buyOnWeekButton"), for: .normal)
        
        premiumOnWeek.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.left.equalTo(premium).inset(15)
            make.top.equalTo(premium).inset(268)
        }
    }
    
    fileprivate func layoutPremiumOnMonth() {
        view.addSubview(premiumOnMonth)
        
        premiumOnMonth.setImage(UIImage(named: "buyOnMonthButton"), for: .normal)
        
        premiumOnMonth.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.left.equalTo(premium).inset(123)
            make.top.equalTo(premium).inset(268)
        }
    }
    
    fileprivate func layoutPremiumForever() {
        view.addSubview(premiumForever)
        
        premiumForever.setImage(UIImage(named: "buyForeverButton"), for: .normal)
        
        premiumForever.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.left.equalTo(premium).inset(231)
            make.top.equalTo(premium).inset(268)
        }
    }
    
    fileprivate func layoutSetDescription() {
        view.addSubview(exampleDescription)
        exampleDescription.font = UIFont(name: "YanoneKaffeesatz-Regular", size: 18)
        exampleDescription.numberOfLines = 0
        exampleDescription.textAlignment = .center
        
        exampleDescription.snp.makeConstraints { make in
            make.width.equalTo(249)
            make.height.equalTo(54)
            make.left.equalTo(exampleSetView).inset(40)
            make.top.equalTo(exampleSetView).inset(104)
        }
        
    }
    
}
