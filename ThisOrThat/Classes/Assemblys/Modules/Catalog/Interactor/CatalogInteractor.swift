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
 
    let purchaseService: PurchaseServiceType
    let setDataService: SetDataServiceType
    
    
    var allSets: [CardSet] {setDataService.getAll()}
    var includedSets: [String] = []
    
    
    init(purchaseService: PurchaseServiceType, setDataService: SetDataServiceType) {
        self.purchaseService = purchaseService
        self.setDataService = setDataService
        Task {
           await fetchProducts()
        }
    }
    
    func fetchProducts() async {
        do {
           let products = try await purchaseService.fetchProducts()
            for item in products {
                if (try await purchaseService.isPurchased(product: item)) {
                    includedSets.append(item.id)
                }
            }
            print("initial \(includedSets.count)")
        }
        
        catch {
            print(error)
        }
    }
    
}

// MARK: Private
extension CatalogInteractor {
    
}
