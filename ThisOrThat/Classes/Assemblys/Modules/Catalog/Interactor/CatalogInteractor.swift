//
//  CatalogInteractor.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class CatalogInteractor: CatalogInteractorInput {
    
    
    var allSets: [CardSet] {setDataService.getAll()}
    
    var includedSets: [String] = ["demo"]
    
    
    
    let setDataService: SetDataServiceType
    
    init(setDataService: SetDataServiceType) {
        self.setDataService = setDataService
    }
    
    
    
}

// MARK: Private
extension CatalogInteractor {
    
}
