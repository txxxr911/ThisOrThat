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
    func restoreTransactions(didRestoreFinished: (() -> Void)?)
    func getAllProducts() -> [SKProduct]
    func isHaveInAppPurchases() -> Bool
    func purchaseProduct(productId: String, didPurchaseFinished: ((Bool) -> Void)?)
    func purchasePremium(productId: String, didPurchaseFinished: ((Bool) -> Void)?)
    func requestProducts(didRequestProductsFinished: (() -> Void)?)
}
