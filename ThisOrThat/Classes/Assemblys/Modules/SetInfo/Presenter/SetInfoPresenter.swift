//
//  SetInfoPresenter.swift
//  ThisOrThat
//
//  Created by Victor on 14.05.2022
//  
//

import Foundation

class SetInfoPresenter: BasePresenter<SetInfoInteractorInput, SetInfoRouterProtocol>, SetInfoModuleOutput {
    
    // MARK: - Weak properties
    weak var view: SetInfoViewInput?
}

// MARK: Private
extension SetInfoPresenter {
    
}

// MARK: Module Input
extension SetInfoPresenter: SetInfoModuleInput {
    
}

// MARK: View Output
extension SetInfoPresenter: SetInfoViewOutput {
    func viewDidLoad() {
        view?.set(title: "SetInfo")
    }
}
