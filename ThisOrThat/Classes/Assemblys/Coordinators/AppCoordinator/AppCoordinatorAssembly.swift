//
//  AppCoordinatorAssembly.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

class AppCoordinatorAssembly: Assembly {
    func build() -> AppCoordinatorType {
        let navigationController = UINavigationController(rootViewController: UIViewController())
        let router = Router(navigationController: navigationController)
        let coordinator = AppCoordinator(container: container, router: router)
        return coordinator
    }
}
