//
//  CardSet.swift
//  ThisOrThat
//
//  Created by Victor on 12.05.2022.
//

import Foundation

struct CardSet: Decodable {

    let id: String
    let image: String
    let icon: String
    let title: String
    let description: String
    let tasksCount: String
}
