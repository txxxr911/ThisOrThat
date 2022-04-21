//
//  MainCoordinator.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

class MainCoordinator: BaseCoordinator, MainCoordinatorType {
    
    override func start() {
        let module = container.resolve(MainAssembly.self).build(coordinator: self)
        router.setRootModule(module)
    }
    
    override func toPresent() -> UIViewController {
        return router.rootViewController!
    }
}

extension MainCoordinator {
    
    func gameStartViewController() -> UIViewController {
        let coordinator = container.resolve(GameStartCoordinatorAssembly.self).build()
        self.addChild(coordinator)
        coordinator.start()
        return coordinator.toPresent()
    }
    
    
    func catalogViewController() -> UIViewController {
        let coordinator = container.resolve(CatalogCoordinatorAssembly.self).build()
        self.addChild(coordinator)
        coordinator.start()
        return coordinator.toPresent()
    }
    
    func rulesViewController() -> UIViewController {
        let coordinator = container.resolve(RulesCoordinatorAssembly.self).build()
        self.addChild(coordinator)
        coordinator.start()
        return coordinator.toPresent()
    }
}
