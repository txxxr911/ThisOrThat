//
//  SetDataService.swift
//  ThisOrThat
//
//  Created by Victor on 12.05.2022
//	
//

import Foundation

class SetDataService: SetDataServiceType, JsonDataService {
    
    func getAll() -> [CardSet] {
        let data = readLocalJSONFile(forName: "sets")
        guard let data = data else {
            return []
        }
        return  parse(jsonData: data) ?? []
    }
}
