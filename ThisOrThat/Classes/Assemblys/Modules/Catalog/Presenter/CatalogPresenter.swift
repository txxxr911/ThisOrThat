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
}

// MARK: Private
extension CatalogPresenter {
    
}

// MARK: Module Input
extension CatalogPresenter: CatalogModuleInput {
    
}

// MARK: View Output
extension CatalogPresenter: CatalogViewOutput {
    func viewDidLoad() {
        view?.set(title: "Catalog")
    }
}
