//
//  StorageService.swift
//  ThisOrThat
//
//  Created by Victor on 20.04.2022
//	
//

import Foundation
import RealmSwift

class StorageService: StorageServiceType {
    
    let realm = try! Realm()
    var didSavedData: (() -> Void)?
    
    func savePlayersData(playersData: PlayersDataSet, didSavedData: @escaping () -> Void) {
        
        self.didSavedData = didSavedData
        
        let data = PlayersDataSet()
        
        try! realm.write{
            
        }
    }
}
