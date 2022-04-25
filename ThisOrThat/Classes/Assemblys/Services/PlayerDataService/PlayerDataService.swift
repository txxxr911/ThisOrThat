//
//  StorageService.swift
//  ThisOrThat
//
//  Created by Victor on 20.04.2022
//	
//

import Foundation
import RealmSwift

class PlayerDataService: PlayerDataServiceType {
    func all() -> [Player] {
        let items = realm.objects(PlayerRealm.self)
        return Array(items.map {Player(realmObject: $0)})
    }
    
    func add(players: [Player]) {
        try! realm.write {
            realm.add(players.map {PlayerRealm(player: $0)})
        }
    }
    
    func delete() {
        let items = realm.objects(PlayerRealm.self)
        try! realm.write {
            realm.delete(items)
        }
    }
    
    
    
    let realm = try! Realm()
    
}
