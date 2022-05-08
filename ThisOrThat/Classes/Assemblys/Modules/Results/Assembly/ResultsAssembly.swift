//
//  ResultsAssembly.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

typealias ResultsModule = Module<ResultsModuleInput, ResultsModuleOutput>

class ResultsAssembly: Assembly {
    func build(players: [Player], coordinator: CoordinatorType) -> ResultsModule {
        // View
        let view = ResultsViewController.controllerFromStoryboard("Results")
        
        // Interactor
        let interactor = ResultsInteractor(players: players)
        
        // Router
        let router = ResultsRouter(coordinator: coordinator)
        
        // Presenter
        let presenter = ResultsPresenter(interactor: interactor, router: router)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        return Module(view: view, input: presenter, output: presenter)
    }
}
