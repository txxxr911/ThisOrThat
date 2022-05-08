//
//  ResultsRouter.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class ResultsRouter: BaseModuleRouter, ResultsRouterProtocol {
    
    func endGame() {
        let module = container.resolve(MainAssembly.self).build(coordinator: coordinator)
        coordinator.router.setRootModule(module)
    }
}
