//
//  StorageServiceAssembly.swift
//  ThisOrThat
//
//  Created by Victor on 20.04.2022
//	
//

import Foundation

class StorageServiceAssembly: Assembly {
    func build() -> StorageServiceType {
        let service = StorageService()
        return service
    }
}
