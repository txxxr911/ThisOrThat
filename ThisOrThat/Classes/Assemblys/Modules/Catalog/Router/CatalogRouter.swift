//
//  CatalogRouter.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class CatalogRouter: BaseModuleRouter, CatalogRouterProtocol {
    func navigateToSet(item: CardSet, onFinished: @escaping () -> Void, onClosed: @escaping () -> Void) {
        let module = container.resolve(SetInfoAssembly.self).build(coordinator: coordinator, set: item, onFinished: onFinished, onClosed: onClosed)
        coordinator.router.present(module, style: .popover)
    }
    
    
    
    func navigateBack() {
        coordinator.router.popModule()
    }
    
    func navigateToPurchase() {
        
    }
    
    func navigateToGame(setNames: [String]) {
        
    }
    
    
}
