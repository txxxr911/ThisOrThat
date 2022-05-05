//
//  GameProcessInteractor.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class GameProcessInteractor: GameProcessInteractorInput {
    
    var items: [Player]
    let questionDataService: QuestionDataServiceType
    let playersDataService: PlayerDataServiceType
    
    private(set) var selectedPlayer: Player?
    
    
    init(items: [Player], questionDataService: QuestionDataServiceType, playersDataService: PlayerDataServiceType) {
        self.items = items
        self.playersDataService = playersDataService
        self.questionDataService = questionDataService
    }
    
    func increaseScore() {
        guard let player = selectedPlayer else { return }
        
        playersDataService.increasePlayerScore(player: player)
        
        
    }
    
    func setPlayer(selected player: Player) {
        selectedPlayer = player
    }
}

// MARK: Private
extension GameProcessInteractor {
    
}
