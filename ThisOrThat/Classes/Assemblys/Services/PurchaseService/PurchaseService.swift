//
//  PurchaseService.swift
//  ThisOrThat
//
//  Created by Victor on 16.05.2022
//	
//

import Foundation
import StoreKit

class PurchaseService: NSObject, ObservableObject, PurchaseServiceType {
    
    var productIDs: Set<String> = ["com.artemtishchenko.thisorthat.cinema", "com.artemtishchenko.thisorthat.xxx", "com.artemtishchenko.thisorthat.school", "com.artemtishchenko.thisOrThat.subscribe1week", "com.artemtishchenko.thisOrThat.subscribe1Month", "com.artemtishchenko.thisOrThat.subscribeForever"]
    
        internal var products: [Product] = []
        public var purchasedIds: [String] = []
    
    
    override init() {
        super.init()
//        Task {
//            try await fetchProducts()
//        }
    }
    
    
    
    
    func purchaseProduct(productId: String) async throws  {
        let product = products.first {$0.id == productId}
        do {
            let result = try await product?.purchase()
            for await result in Transaction.updates {
                switch result {

                    case .verified(let transaction):
                        self.purchasedIds.append(transaction.productID)
                        print(transaction.productID)
                        
                    case .unverified(_):
                        break;
                    }
            }
//            switch result {
//
//            case .success(let verification):
//                print("Purchase is successfull")
//                switch verification {
//
//                case .verified(let transaction):
//                    self.purchasedIds.append(transaction.productID)
//                    print(transaction.productID)
//
//                case .unverified(_):
//                    break;
//                }
//            case .userCancelled:
//                return
//                break;
//
//            case .pending:
//                return
//                break;
//
//            default:
//                break;
//                }
        }
        catch {
            print(error)
        }
    }
    
    func fetchProducts() async throws -> [Product] {
        do {
        let products = try await Product.products(for: productIDs)
        DispatchQueue.main.async {
            self.products = products
            }
            for item in self.products {
                if (try await isPurchased(productId: item.id)!) {
                    print("append")
                    purchasedIds.append(item.id)
                }
                
            }
        }
        catch {
            print(error)
        }
        print ("I fetched products and now buyed card sets count is: \(purchasedIds.count)")
        return products

    }
    
    func isPurchased(productId: String) async throws -> Bool? {
        guard let result = await Transaction.latest(for: productId) else {
            return false
        }
        switch result {
        case .unverified(_):
            print("The purchase isn't verified")
            break
            
        case .verified(let transaction):
            print("Transaction verified")
            await transaction.finish()
            return transaction.revocationDate == nil && !transaction.isUpgraded
        }
        
        return nil
    }
    func isHaveActiveSubscribe() async throws -> Bool {
         true
    }
    
    func restoreSubscribe() async throws {
        
    }
}

    

