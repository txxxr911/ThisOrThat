//
//  PlayerData.swift
//  ThisOrThat
//
//  Created by Victor on 20.04.2022.
//

import Foundation
import RealmSwift

struct PlayersDataSet {
    var playersData: [PlayerData] = []
}

class PlayerData: Object {
    @objc dynamic var playerName: String? = ""
    @objc dynamic var iconName: String? = ""
}
