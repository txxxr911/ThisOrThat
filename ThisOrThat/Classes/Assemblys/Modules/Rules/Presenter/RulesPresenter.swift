//
//  RulesPresenter.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class RulesPresenter: BasePresenter<RulesInteractorInput, RulesRouterProtocol>, RulesModuleOutput {
    
    // MARK: - Weak properties
    weak var view: RulesViewInput?
}

// MARK: Private
extension RulesPresenter {
    
}

// MARK: Module Input
extension RulesPresenter: RulesModuleInput {
    
}

// MARK: View Output
extension RulesPresenter: RulesViewOutput {
    func viewDidLoad() {
        view?.set(title: "Rules")
    }
}
