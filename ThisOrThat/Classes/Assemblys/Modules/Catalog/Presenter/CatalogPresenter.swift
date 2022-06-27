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
        
        var data: [CardSet] = []
        data.append(contentsOf: interactor.allSets)
        
        return data
    }
    
    var purchasedIds: [String] = []
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
        router.navigateToSet(item: item, onFinished: {
            [weak self] in
            guard let self = self else {return}
            self.router.navigateBack()
        },
                             onClosed: {
            
        })
    }
    
    func didTapBackButton() {
        
    }
    
    func viewDidLoad() {
        print ("Buyed sets")
        for item in self.purchasedIds {
            print(item)
        }
    }
    
    
}
