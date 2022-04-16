//
//  BasePresenter.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class BasePresenter<I, R> {
    let interactor: I
    let router: R
    
    init(interactor: I, router: R) {
        self.interactor = interactor
        self.router = router
    }
}
