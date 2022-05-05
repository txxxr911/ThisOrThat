//
//  StartGameRouter.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class StartGameRouter: BaseModuleRouter, StartGameRouterProtocol {
    func navigateBack() {
        coordinator.router.popModule()
    }
    
    // tut pomenyat
    func navigateToCatalog(players: [Player]) {
        let module = container.resolve(GameProcessAssembly.self).build(items: players , coordinator: coordinator)
        coordinator.router.push(module)
    }
    
    func navigateToMain() {
        let module = container.resolve(MainAssembly.self).build(coordinator: coordinator)
        coordinator.router.setRootModule(module, hideBar: true)
    }
    
    func showGameProcessView(players: [Player]) {
        let module = self.container.resolve(GameProcessAssembly.self).build(items: players, coordinator: self.coordinator)
        coordinator.router.push(module)
    }
    
    
}
