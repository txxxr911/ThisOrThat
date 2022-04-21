//
//  StartGameRouter.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class StartGameRouter: BaseModuleRouter, StartGameRouterProtocol {
    func showGameProcessView() {
        let module = self.container.resolve(GameProcessAssembly.self).build(coordinator: self.coordinator)
        coordinator.router.push(module)
    }
    
    
}
