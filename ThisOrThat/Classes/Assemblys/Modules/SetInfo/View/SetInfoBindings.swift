//
//  SetInfoBindings.swift
//  ThisOrThat
//
//  Created by Victor on 14.05.2022.
//

import Foundation

extension SetInfoViewController {
    
    func bind() {
        bindBuySetButton()
        bindPremiumOnWeekButton()
        bindPremiumOnMonthButton()
        bindPremiumForeverButton()
   }
   
    fileprivate func bindBuySetButton() {
        buySetButton.addTarget(self, action: #selector(didTapBuySetButton), for: .touchUpInside)
    }
    
    fileprivate func bindPremiumOnWeekButton() {
        premiumOnWeek.addTarget(self, action: #selector(didTapPremiumOnWeekButton), for: .touchUpInside)
        
    }
    
    fileprivate func bindPremiumOnMonthButton() {
        premiumOnMonth.addTarget(self, action: #selector(didTapPremiumOnMonthButton), for: .touchUpInside)
        
    }
    
    fileprivate func bindPremiumForeverButton() {
        premiumForever.addTarget(self, action: #selector(didTapPremiumForeverButton), for: .touchUpInside)
        
    }
}
