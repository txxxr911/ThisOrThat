//
//  GameProcessInteractor.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class GameProcessInteractor: GameProcessInteractorInput {
    
    var players: [Player]
    var items: [QuestionModel] = []
    
    let questionDataService: QuestionDataServiceType
    let playersDataService: PlayerDataServiceType
    var round = 1
    
    var leadingPlayer: Player?
    var playersInGame: [Player]
    
    private(set) var selectedPlayer: Player?
    
    
    init(players: [Player], playersInGame: [Player], leadingPlayer: Player, questionDataService: QuestionDataServiceType, playersDataService: PlayerDataServiceType) {
        self.players = players
        self.playersDataService = playersDataService
        self.questionDataService = questionDataService
        self.leadingPlayer = leadingPlayer
        self.playersInGame = playersInGame
    }
    
    func increaseScore() {
        guard let player = selectedPlayer else { return }
        
        playersDataService.increasePlayerScore(player: player)
        
        
    }
    
    func endGame() {
        players.removeAll()
        players.append(contentsOf: playersDataService.all())
    }
    
    func changeQuestion() {
        
    }
    
    func changeLeading() {
        guard let player = leadingPlayer else { return }
        guard let currentPlayerIndex = players.firstIndex(of: player) else { return }
        
        if players.count - 1 == currentPlayerIndex {
            self.leadingPlayer = players[0]
        }
        else {
            self.leadingPlayer = players[currentPlayerIndex + 1]
        }
        round += 1
    }
    
    func setPlayersInGame() {
        playersInGame = players.filter { $0.id != leadingPlayer?.id }
    }
    
    func setPlayer(selected player: Player) {
        selectedPlayer = player
        print("selected \(player.name)")
    }
    
    func loadCards() {
        items.removeAll()
        //let models = questionDataService.getFree(setName: set)
    }
}

// MARK: Private
extension GameProcessInteractor {
    
}
