//
//  StartGamePresenter.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class StartGamePresenter: BasePresenter<StartGameInteractorInput, StartGameRouterProtocol>, StartGameModuleOutput {
    var items: [Player] { interactor.items }
    
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
    func addPlayer() {
        interactor.addPlayer()
    }
    
    func didRemoveItem(player: Player) {
        interactor.removePlayer(player: player)
    }
    
    func changeSexButtonDidTap(player: Player) {
        interactor.changeSex(player: player)
    }
    
    func didTapBackButton() {
        
    }
    
    func startButtonPressed() {
        do {
            try validatePlayers()
        }
        
        catch {
            print(error)
        }
        interactor.save()
        router.navigateToCatalog()
        //router.showGameProcessView()
    }
    
    func validatePlayers() throws {
        if interactor.items.count < 2 { print("Небольшая компания у вас") }
    }
    
    func viewDidLoad() {
        view?.set(title: "StartGame")
    }
}
