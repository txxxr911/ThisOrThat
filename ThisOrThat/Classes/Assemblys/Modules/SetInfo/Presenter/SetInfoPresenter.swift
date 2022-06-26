//
//  SetInfoPresenter.swift
//  ThisOrThat
//
//  Created by Victor on 14.05.2022
//  
//

import Foundation
import ProgressHUD


class SetInfoPresenter: BasePresenter<SetInfoInteractorInput, SetInfoRouterProtocol>, SetInfoModuleOutput {
    // MARK: - Weak properties
    weak var view: SetInfoViewInput?
}

// MARK: Private
extension SetInfoPresenter {
    
}

// MARK: Module Input
extension SetInfoPresenter: SetInfoModuleInput {
    
}

// MARK: View Output
extension SetInfoPresenter: SetInfoViewOutput {
    var item: CardSet {
        interactor.item
    }
    
    func purchaseSetButton(item: CardSet) {
        interactor.purchaseItem(productId: item.id)
    }
    
//    func purchasePremium(for period: productIDs) {
//        
//    }
    
    func viewDidLoad() {
        view?.set()
    }
}
