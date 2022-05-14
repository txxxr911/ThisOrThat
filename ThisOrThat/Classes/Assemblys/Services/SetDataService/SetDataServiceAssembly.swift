//
//  SetDataServiceAssembly.swift
//  ThisOrThat
//
//  Created by Victor on 12.05.2022
//	
//

import Foundation

class SetDataServiceAssembly: Assembly {
    func build() -> SetDataServiceType {
        let service = SetDataService()
        return service
    }
}
