//
//  CatalogAssembly.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

typealias CatalogModule = Module<CatalogModuleInput, CatalogModuleOutput>

class CatalogAssembly: Assembly {
    func build(coordinator: CoordinatorType) -> CatalogModule {
        // View
        let view = CatalogViewController.controllerFromStoryboard("Catalog")
        
        // Interactor
        let interactor = CatalogInteractor()
        
        // Router
        let router = CatalogRouter(coordinator: coordinator)
        
        // Presenter
        let presenter = CatalogPresenter(interactor: interactor, router: router)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        return Module(view: view, input: presenter, output: presenter)
    }
}
