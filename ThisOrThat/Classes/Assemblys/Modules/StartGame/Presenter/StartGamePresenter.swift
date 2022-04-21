//
//  StartGamePresenter.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class StartGamePresenter: BasePresenter<StartGameInteractorInput, StartGameRouterProtocol>, StartGameModuleOutput {
    
    // MARK: - Weak properties
    weak var view: StartGameViewInput?
}

// MARK: Private
extension StartGamePresenter {
    
}

// MARK: Module Input
extension StartGamePresenter: StartGameModuleInput {
    
}

// MARK: View Output
extension StartGamePresenter: StartGameViewOutput {
    func startButtonPressed() {
        router.showGameProcessView()
    }
    
    func viewDidLoad() {
        view?.set(title: "StartGame")
    }
}
