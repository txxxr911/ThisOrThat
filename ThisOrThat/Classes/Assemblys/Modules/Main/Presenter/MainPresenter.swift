//
//  MainPresenter.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class MainPresenter: BasePresenter<MainInteractorInput, MainRouterProtocol>, MainModuleOutput {
    // MARK: - Weak properties
    weak var view: MainViewInput?
}

// MARK: Private
extension MainPresenter {
    
}

// MARK: Module Input
extension MainPresenter: MainModuleInput {
    
}

// MARK: View Output
extension MainPresenter: MainViewOutput {
    func viewDidLoad() {
    }
    
    func startbuttonPressed() {
        router.showGameStartView()
    }
    
    func catalogButtonPressed() {
        router.showCatalogView()
    }
    
    func rulesButtonPressed() {
        router.showRulesView()
    }
}
