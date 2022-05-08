//
//  ResultsInteractor.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class ResultsInteractor: ResultsInteractorInput {
    var players: [Player]
    var playersDataService: PlayerDataServiceType
    
    init(players: [Player], playersDataService: PlayerDataServiceType) {
        self.players = players
        self.playersDataService = playersDataService
    }
    
    func resetData() {
        playersDataService.delete()
    }
}

// MARK: Private
extension ResultsInteractor {
    
}
