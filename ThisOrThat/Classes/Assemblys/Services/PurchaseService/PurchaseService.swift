//
//  PurchaseService.swift
//  ThisOrThat
//
//  Created by Victor on 16.05.2022
//	
//

import Foundation
import StoreKit

class PurchaseService: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver, PurchaseServiceType {

    var request: SKProductsRequest!
    
    private var didPurchaseFinished: ((Bool)-> Void)?
    private var didRequestProductsFinished: (()-> Void)?
    private var items: [SKProduct] = []
    
    override init() {
        super.init()
        SKPaymentQueue.default().add(self)
        requestProducts(didRequestProductsFinished: nil)
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        items.removeAll()
        
        for item in response.products {
            items.append(item)
        }
        
        didRequestProductsFinished?()
        didRequestProductsFinished = nil
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in SKPaymentQueue.default().transactions {
            guard
                transaction.transactionState != .purchasing,
                transaction.transactionState != .deferred
            else {
                //Optionally provide user feedback for pending or processing transactions
                return
            }
            //Transaction can now be safely finished
            SKPaymentQueue.default().finishTransaction(transaction)
            if transaction.transactionState != .failed {
                UserDefaults.standard.setValue(true, forKey: transaction.payment.productIdentifier)
            }
            
            if transaction.transactionState == .restored {
                UserDefaults.standard.setValue(transaction.isActive, forKey: transaction.payment.productIdentifier)
            }
            
        }
        let finishedTransactions = transactions.filter { $0.transactionState == .purchased}
        let isFinished = finishedTransactions.count > 0
        didPurchaseFinished?(isFinished)
        didPurchaseFinished = nil
    }
    
    func restoreTransactions(didRestoreFinished: (() -> Void)?) {
        DispatchQueue.global().asyncAfter(deadline: .now()+2) {
            didRestoreFinished?()
        }
    }
    
    func getAllProducts() -> [SKProduct] {
        items
    }
    
    func isHaveInAppPurchases() -> Bool {
        items
            .filter {
                UserDefaults.standard.value(forKey: $0.productIdentifier) as? Bool == true
            }
            .count > 0
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        print("Request did fail: \(error)")
    }
    
    func purchaseProduct(productId: String, didPurchaseFinished: ((Bool) -> Void)?) {
        
        self.didPurchaseFinished = didPurchaseFinished
        let product = items.first { $0.productIdentifier == productId }
        guard product != nil else { return }
        self.purchaseProduct(product: product!)
    }
    
    
    func purchaseProduct(product: SKProduct) {
        if SKPaymentQueue.canMakePayments() {
            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(payment)
        } else {
            print("User can't make payment.")
        }
    }
    
    func purchasePremium(product: SKProduct) {
        if SKPaymentQueue.canMakePayments() {
            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(payment)
        } else {
            print("User can't make payment.")
        }
    }
    
    func purchasePremium(productId: String, didPurchaseFinished: ((Bool) -> Void)?) {
        self.didPurchaseFinished = didPurchaseFinished
        let product = items.first {$0.productIdentifier == productId}
        guard product != nil else { return }
        self.purchasePremium(product: product!)
    }
    
    
    func requestStart() {
        
        let products = productIDs.allCases
        let ids = products.map { $0.rawValue }
        let request = SKProductsRequest(productIdentifiers: Set(ids))
        request.delegate = self
        
        request.start()
    }
    
    func requestProducts(didRequestProductsFinished: (() -> Void)?) {
        self.didRequestProductsFinished = didRequestProductsFinished
        requestStart()
    }
    
    
    private func restoreCompletedTransactions() {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
}

enum productIDs: String, CaseIterable {
    case subscribeWeek = "com.artemtishchenko.thisOrThat.subscribe1week"
    case subscribeMonth = "com.artemtishchenko.thisOrThat.subscribe1Month"
    case subscribeForever = "com.artemtishchenko.thisOrThat.subscribeForever"
}

extension SKPaymentTransaction {
    var isActive : Bool {
        if payment.productIdentifier == productIDs.subscribeWeek.rawValue {
            guard let date = transactionDate else {
                return false
            }
            let deltaSeconds = date.distance(to: Date())
            let deltaHours = deltaSeconds / 60 / 60
            let hoursIn1Week: Double = 7 * 24
            
            if (deltaHours < hoursIn1Week) {
                return true
            }
            
            return false
        }
        
        if payment.productIdentifier == productIDs.subscribeMonth.rawValue {
            guard let date = transactionDate else {
                return false
            }
            let deltaSeconds = date.distance(to: Date())
            let deltaHours = deltaSeconds / 60 / 60
            let hoursIn1Year: Double = 7 * 365
            
            if (deltaHours < hoursIn1Year) {
                return true
            }
            
            return false
        }
        
        if payment.productIdentifier == productIDs.subscribeMonth.rawValue {
            guard let date = transactionDate else {
                return false
            }
            let deltaSeconds = date.distance(to: Date())
            let deltaHours = deltaSeconds / 60 / 60
            let hoursIn1Month: Double = 7 * 31
            
            if (deltaHours < hoursIn1Month) {
                return true
            }
            
            return false
        }
        
        return true
    }
    
}

extension SKProduct {
    
    var localizedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        if priceLocale.languageCode?.lowercased().contains("ru") ?? false {
            return Int(truncating: price).toString() + " ₽"
        }
        formatter.locale = priceLocale
        return formatter.string(from: price)!
    }

}
