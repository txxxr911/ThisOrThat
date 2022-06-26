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
    var items: [CardSet] { get }
    func didSelectItem(item: CardSet)
    func didTapBackButton()
}

// Interactor
protocol CatalogInteractorInput {
    var allSets: [CardSet] { get }
    var purchasedSets: [String] { get }
    
}

// Router
protocol CatalogRouterProtocol: AlertRoutable {
    func navigateToSet(item: CardSet, onFinished: @escaping () -> Void, onClosed: @escaping () -> Void)
    func navigateBack()
    func navigateToGame(setNames: [String])
}
