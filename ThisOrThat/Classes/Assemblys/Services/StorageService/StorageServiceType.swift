//
//  StorageServiceType.swift
//  ThisOrThat
//
//  Created by Victor on 20.04.2022
//	
//

import Foundation

protocol StorageServiceType {
    func savePlayersData(playersData: PlayersDataSet, didSavedData: @escaping () -> Void)
}
