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
        internal var purchasedIds: [String] = []
    
    
    override init() {
        super.init()
    }
    
    func fetchProducts() async throws -> [Product] {
        do {
            let products = try await Product.products(for: productIDs)
            
            DispatchQueue.main.sync {
                self.products = products
            }
            print("now is: \(self.products.count)")
            for item in self.products {
                print("a")
                if (try await isPurchased(product: item)) {
                    print("append")
                    purchasedIds.append(item.id)
                }
                else {
                    print("No")
                }
            }
        }
                
        catch {
            print("Failed product fetch: \(error)")
        }
        return products
    }
    
    
    
    func purchaseProduct(productId: String) async throws {
        let product = products.first {$0.id == productId}
        
        do {
            let result = try await product?.purchase()
            
            switch result {
            case .success(let verification):
                print("Purchase is successfull")
                
                switch verification {
                case .verified(let transaction):
                    if transaction.revocationDate == nil {
                        purchasedIds.append(transaction.productID)
                    }
                    
                    else {
                        purchasedIds.removeObject(transaction.productID)
                    }
                    await transaction.finish()
                    print(transaction.productID)
                    print(purchasedIds.count)
                    
                    
                case .unverified(_):
                    break;
                }
            case .userCancelled:
                break;
        
            case .pending:
                break;
                
            default:
                break;
                    }
                }
            }
    
    func isPurchased(product: Product) async throws -> Bool {
        guard let state = await product.currentEntitlement
        else {return false}
        print(state)
        
            switch state {
                
            case .verified(_):
                return true
                
            case .unverified(_):
                return false
                print("Purchase isn't verified")
            }

    }
    
    func isHaveActiveSubscribe() async throws -> Bool {
        true
    }
    
    func restoreSubscribe() async throws {
        
    }
    
//    func purchaseProduct(productId: String) async throws  {
//        let product = products.first {$0.id == productId}
//        do {
//            let result = try await product?.purchase()
//            switch result {
//
//            case .success(let verification):
//                print("Purchase is successfull")
//
//
//                switch verification {
//
//                case .verified(let transaction):
//                    if transaction.revocationDate == nil {
//                        purchasedIds.append(transaction.productID)
//                            } else {
//                                purchasedIds.removeObject(transaction.productID)
//                            }
//                    await transaction.finish()
//                    print(transaction.productID)
//                    print(purchasedIds.count)
//
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
//        }
//        catch {
//            print(error)
//        }
//    }
//
//    func getPurchased() -> [String] {
//        print("I back \(purchasedIds.count) items")
//        return purchasedIds
//    }
//
//    func fetchProducts() async throws -> [Product] {
//        do {
//        let products = try await Product.products(for: productIDs)
//        DispatchQueue.main.async {
//            self.products = products
//            }
//            for item in self.products {
//                if (try await isPurchased(productId: item.id)!) {
//                    print("append")
//                    purchasedIds.append(item.id)
//                }
//
//            }
//        }
//        catch {
//            print(error)
//        }
//        print ("I fetched products and now buyed card sets count is: \(purchasedIds.count)")
//        return products
//
//    }
//
//    func isPurchased(productId: String) async throws -> Bool? {
//        guard let result = await Transaction.latest(for: productId) else {
//            return false
//        }
//        switch result {
//        case .unverified(_):
//            print("The purchase isn't verified")
//            break
//
//        case .verified(let transaction):
//            print("Transaction verified")
//            await transaction.finish()
//            return transaction.revocationDate == nil && !transaction.isUpgraded
//        }
//
//        return nil
//    }
//    func isHaveActiveSubscribe() async throws -> Bool {
//         true
//    }
//
//    func restoreSubscribe() async throws {
//
//    }
}

    

