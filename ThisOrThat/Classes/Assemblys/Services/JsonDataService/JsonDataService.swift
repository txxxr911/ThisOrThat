//
//  JsonDataService.swift
//  ThisOrThat
//
//  Created by Victor on 02.05.2022
//	
//

import Foundation

protocol JsonDataService {
    
}

extension JsonDataService {
    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        }
        catch {
            print("error \(error)")
        }
        return nil
    }
    
    func parse<T:Decodable>(jsonData: Data) -> [T]? {
        do {
            let decodedData = try JSONDecoder().decode([T].self, from: jsonData)
            return decodedData
        }
        catch {
            print("error \(error)")
        }
        return nil
    }
}
