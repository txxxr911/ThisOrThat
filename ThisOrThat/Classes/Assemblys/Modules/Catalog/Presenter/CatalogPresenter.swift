//
//  CatalogPresenter.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class CatalogPresenter: BasePresenter<CatalogInteractorInput, CatalogRouterProtocol>, CatalogModuleOutput {
    
    // MARK: - Weak properties
    weak var view: CatalogViewInput?
    
    var items: [CardSet] {
        let sets = interactor.allSets
        
        var data: [CardSet] = []
        data.append(contentsOf: sets)
        
        return data
    }
}

// MARK: Private
extension CatalogPresenter {
    
}

// MARK: Module Input
extension CatalogPresenter: CatalogModuleInput {
    
}

// MARK: View Output
extension CatalogPresenter: CatalogViewOutput {
    func didSelectItem(item: CardSet) {
        router.navigateToSet(item: item)
        return
    }
    
    func didTapBackButton() {
        
    }
    
    func viewDidLoad() {
    }
    
    
}
