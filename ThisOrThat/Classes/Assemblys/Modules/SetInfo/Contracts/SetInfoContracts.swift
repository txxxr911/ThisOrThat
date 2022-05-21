//
//  SetInfoContracts.swift
//  ThisOrThat
//
//  Created by Victor on 14.05.2022
//  
//

import Foundation

// Module Input
protocol SetInfoModuleInput {
    
}

// Module Output
protocol SetInfoModuleOutput {
    
}

// View Input
protocol SetInfoViewInput: class {
    func set()
}

// View Output
protocol SetInfoViewOutput: class {
    func viewDidLoad()
    var item: CardSet { get }
    func purchaseSetButton(item: CardSet)
    func purchasePremium(for period: productIDs)
    

}

// Interactor
protocol SetInfoInteractorInput {
    var item: CardSet { get }
    func didFinished()
    func didClosed()
    func purchaseItem(productId: String, didFinished: @escaping (Bool) -> Void)
    //func sendSelectedSet() 
}

// Router
protocol SetInfoRouterProtocol: AlertRoutable {
    
}
