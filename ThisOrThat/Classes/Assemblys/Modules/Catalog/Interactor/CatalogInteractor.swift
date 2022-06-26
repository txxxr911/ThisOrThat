//
//  CatalogInteractor.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation
import StoreKit

class CatalogInteractor: CatalogInteractorInput {
    
    var purchasedSets: [String] {purchaseService.purchasedIds}
    var allSets: [CardSet] {setDataService.getAll()}
    
    
    var includedSets: [String] = ["demo"]
    
    
    let purchaseService: PurchaseServiceType
    let setDataService: SetDataServiceType
    
    init(purchaseService: PurchaseServiceType, setDataService: SetDataServiceType) {
        self.purchaseService = purchaseService
        self.setDataService = setDataService
        Task {
            try await purchaseService.fetchProducts()
        }
        
       
    }
    
    
    
}

// MARK: Private
extension CatalogInteractor {
    
}
