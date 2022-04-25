//
//  StartGameInteractor.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class StartGameInteractor: StartGameInteractorInput {

    let playerDataService: PlayerDataServiceType
    var items: [Player] = []
    
    init (playerDataService: PlayerDataServiceType) {
        self.playerDataService = playerDataService
        items.append(contentsOf: playerDataService.all())
    }

    func addPlayer() {
        let player = Player()
        player.image = playerImage(player: player)
        items.append(player)
    }
    
    func removePlayer(player: Player) {
        items.removeObject(player)
    }
    
    func changeSex(player: Player) {
        if (player.sex == .man) {player.sex = .woman} else {player.sex = .man}
    }
    
    func save() {
        playerDataService.delete()
        playerDataService.add(players: items)
    }
    
    fileprivate func playerImage(player: Player) -> String {
        let number = Int.random(in: 1...10)
        return "team_image_\(number)"
    }
    
}

// MARK: Private
extension StartGameInteractor {
    
}
