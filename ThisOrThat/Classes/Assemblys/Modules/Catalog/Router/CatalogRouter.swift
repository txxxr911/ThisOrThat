//
//  CatalogRouter.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class CatalogRouter: BaseModuleRouter, CatalogRouterProtocol {
    func navigateToSet(item: CardSet) {
        let module = container.resolve(SetInfoAssembly.self).build(coordinator: coordinator, set: item)
        coordinator.router.present(module, style: .popover)
    }
    
    func navigateBack() {
        
    }
    
    func navigateToPurchase() {
        
    }
    
    func navigateToGame(setNames: [String]) {
        
    }
    
    
}
