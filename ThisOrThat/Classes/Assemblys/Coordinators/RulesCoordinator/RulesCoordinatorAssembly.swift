//
//  RulesAssembly.swift
//  ThisOrThat
//
//  Created by Victor on 18.04.2022
//	
//

import UIKit

class RulesCoordinatorAssembly: Assembly {
    func build() -> RulesCoordinatorType {
        let navigationController = UINavigationController(rootViewController: UIViewController())
        let router = Router(navigationController: navigationController)
        let coordinator = RulesCoordinator(container: container, router: router)
        return coordinator
    }
}
