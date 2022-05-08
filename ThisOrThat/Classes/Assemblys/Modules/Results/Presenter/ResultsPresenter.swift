//
//  ResultsPresenter.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class ResultsPresenter: BasePresenter<ResultsInteractorInput, ResultsRouterProtocol>, ResultsModuleOutput {
    var players: [Player] {interactor.players.sorted {
        $0.score > $1.score
    }}
    // MARK: - Weak properties
    weak var view: ResultsViewInput?
}

// MARK: Private
extension ResultsPresenter {
    
}

// MARK: Module Input
extension ResultsPresenter: ResultsModuleInput {
    
}

// MARK: View Output
extension ResultsPresenter: ResultsViewOutput {
    func endGame() {
        interactor.resetData()
        router.endGame()
    }
    
    func viewDidLoad() {
        view?.set(title: "Results")
    }
}
