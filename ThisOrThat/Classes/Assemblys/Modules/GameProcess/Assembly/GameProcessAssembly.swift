//
//  GameProcessAssembly.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

typealias GameProcessModule = Module<GameProcessModuleInput, GameProcessModuleOutput>

class GameProcessAssembly: Assembly {
    func build(coordinator: CoordinatorType) -> GameProcessModule {
        // View
        let view = GameProcessViewController.controllerFromStoryboard("GameProcess")
        
        // Interactor
        let interactor = GameProcessInteractor()
        
        // Router
        let router = GameProcessRouter(coordinator: coordinator)
        
        // Presenter
        let presenter = GameProcessPresenter(interactor: interactor, router: router)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        return Module(view: view, input: presenter, output: presenter)
    }
}
