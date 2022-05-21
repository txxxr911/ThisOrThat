//
//  SetInfoAssembly.swift
//  ThisOrThat
//
//  Created by Victor on 14.05.2022
//  
//

import UIKit

typealias SetInfoModule = Module<SetInfoModuleInput, SetInfoModuleOutput>

class SetInfoAssembly: Assembly {
    func build(coordinator: CoordinatorType, set: CardSet, onFinished: @escaping () ->Void, onClosed: @escaping () -> Void) -> SetInfoModule {
        // View
        let view = SetInfoViewController.controllerFromStoryboard("SetInfo")
        
        // Services
        
        let purchaseService = container.resolve(PurchaseServiceAssembly.self).build()
        
        // Interactor
        let interactor = SetInfoInteractor(item: set, purchaseService: purchaseService , onFinished: onFinished, onClosed: onClosed)
        
        // Router
        let router = SetInfoRouter(coordinator: coordinator)
        
        // Presenter
        let presenter = SetInfoPresenter(interactor: interactor, router: router)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        return Module(view: view, input: presenter, output: presenter)
    }
}
