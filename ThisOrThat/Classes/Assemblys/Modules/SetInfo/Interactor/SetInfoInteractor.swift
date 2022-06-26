//
//  SetInfoInteractor.swift
//  ThisOrThat
//
//  Created by Victor on 14.05.2022
//  
//

import Foundation

class SetInfoInteractor: SetInfoInteractorInput {
    func sendSelectedSet() {
        
    }
    
    
    
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
        print("init set info")
        Task {
        try await purchaseService.fetchProducts()
        }
    }
    
    func didFinished() {
        onFinished()
    }
    
    func didClosed() {
        onClosed()
    }
    
    func purchaseItem(productId: String) {
        Task {
            try await purchaseService.purchaseProduct(productId: productId)
        }
    }
}


// MARK: Private
extension SetInfoInteractor {
    
}
