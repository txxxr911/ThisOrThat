//
//  CatalogAssembly.swift
//  ThisOrThat
//
//  Created by Victor on 18.04.2022
//	
//

import UIKit

class CatalogCoordinatorAssembly: Assembly {
    func build() -> CatalogCoordinatorType {
        let navigationController = UINavigationController(rootViewController: UIViewController())
        let router = Router(navigationController: navigationController)
        let coordinator = CatalogCoordinator(container: container, router: router)
        return coordinator
    }
}
