//
//  GameStartAssembly.swift
//  ThisOrThat
//
//  Created by Victor on 18.04.2022
//	
//

import UIKit

class GameStartCoordinatorAssembly: Assembly {
    func build() -> GameStartCoordinatorType {
        let navigationController = UINavigationController(rootViewController: UIViewController())
        let router = Router(navigationController: navigationController)
        let coordinator = GameStartCoordinator(container: container, router: router)
        return coordinator
    }
}
