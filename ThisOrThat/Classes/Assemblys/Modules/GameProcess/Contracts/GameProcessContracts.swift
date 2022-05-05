//
//  GameProcessContracts.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

// Module Input
protocol GameProcessModuleInput {
    
}

// Module Output
protocol GameProcessModuleOutput {
    
}

// View Input
protocol GameProcessViewInput: class {
    func set(title: String)
}

// View Output
protocol GameProcessViewOutput: class {
    func viewDidLoad()
    var items: [Player] { get }
    func didSelectedPlayer(by index: Int)
}

// Interactor
protocol GameProcessInteractorInput {
    var items: [Player] {get set}
    func increaseScore()
    func setPlayer(selected player: Player)
    var selectedPlayer: Player? {get}
}

// Router
protocol GameProcessRouterProtocol: AlertRoutable {
    
}
