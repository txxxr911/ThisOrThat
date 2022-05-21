//
//  SetInfoInteractor.swift
//  ThisOrThat
//
//  Created by Victor on 14.05.2022
//  
//

import Foundation

class SetInfoInteractor: SetInfoInteractorInput {
    
    
    let purchaseService: PurchaseServiceType
    let onFinished: () -> Void
    let onClosed: () -> Void
    //let source: String
    
    let item: CardSet
    
    
    init(item: CardSet, purchaseService: PurchaseServiceType, onFinished: @escaping ()->Void , onClosed: @escaping ()->Void) {
        self.purchaseService = purchaseService
        self.onFinished = onFinished
        self.onClosed = onClosed
        self.item = item
    }
    
    func didFinished() {
        onFinished()
    }
    
    func didClosed() {
        onClosed()
    }
    
    func purchaseItem(productId: String, didFinished: @escaping (Bool) -> Void) {
        let block: (Bool) -> Void = { [weak self] result in
            didFinished(result)
        }
            purchaseService.purchaseProduct(productId: productId, didPurchaseFinished: block)
        }
    
    func purchasePremium(for period: productIDs, didFinished: @escaping (Bool) -> Void) {
        let block: (Bool) -> Void = {[weak self] result in
            didFinished(result)
        }
        purchaseService.purchasePremium(productId: period.rawValue, didPurchaseFinished: block)
    }
    
}

// MARK: Private
extension SetInfoInteractor {
    
}
