//
//  CatalogContracts.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

// Module Input
protocol CatalogModuleInput {
    
}

// Module Output
protocol CatalogModuleOutput {
    
}

// View Input
protocol CatalogViewInput: class {
    func set(title: String)
}

// View Output
protocol CatalogViewOutput: class {
    func viewDidLoad()
}

// Interactor
protocol CatalogInteractorInput {
}

// Router
protocol CatalogRouterProtocol: AlertRoutable {
    
}
