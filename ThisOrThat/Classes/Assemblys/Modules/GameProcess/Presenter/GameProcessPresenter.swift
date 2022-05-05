//
//  GameProcessPresenter.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class GameProcessPresenter: BasePresenter<GameProcessInteractorInput, GameProcessRouterProtocol>, GameProcessModuleOutput {
    var items: [Player] {interactor.items}
    
    // MARK: - Weak properties
    weak var view: GameProcessViewInput?
}

// MARK: Private
extension GameProcessPresenter {
    
}

// MARK: Module Input
extension GameProcessPresenter: GameProcessModuleInput {
    
}

// MARK: View Output
extension GameProcessPresenter: GameProcessViewOutput {
    func viewDidLoad() {
        //view?.set(title: "GameProcess")
    }
    
    func didTapResultsButton() {
        
    }
    
    func didTapNextStepButton() {
        if (interactor.selectedPlayer == nil) {return}
        else {
            interactor.increaseScore()
        }
        
    }
    
    func didSelectedPlayer(by index: Int) {
        let player = interactor.items[index]
        interactor.setPlayer(selected: player)
    }
    
}
