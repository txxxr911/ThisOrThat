//
//  PurchaseServiceType.swift
//  ThisOrThat
//
//  Created by Victor on 16.05.2022
//	
//

import Foundation
import StoreKit

protocol PurchaseServiceType {
    
    var products: [Product] {get set}
    var purchasedIds: [String] {get set}
    
    func isHaveActiveSubscribe() async throws -> Bool
    func restoreSubscribe() async throws
    func purchaseProduct(productId: String) async throws
    func fetchProducts() async throws -> [Product]
}
