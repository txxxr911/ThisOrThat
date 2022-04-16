//
//  MainCoordinatorAssembly.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class MainCoordinatorAssembly: Assembly {
    func build(router: RouterType) -> MainCoordinatorType {
        let coordinator = MainCoordinator(container: container, router: router)
        return coordinator
    }
}
