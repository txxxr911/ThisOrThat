//
//  RulesAssembly.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

typealias RulesModule = Module<RulesModuleInput, RulesModuleOutput>

class RulesAssembly: Assembly {
    func build(coordinator: CoordinatorType) -> RulesModule {
        // View
        let view = RulesViewController.controllerFromStoryboard("Rules")
        
        // Interactor
        let interactor = RulesInteractor()
        
        // Router
        let router = RulesRouter(coordinator: coordinator)
        
        // Presenter
        let presenter = RulesPresenter(interactor: interactor, router: router)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        return Module(view: view, input: presenter, output: presenter)
    }
}
