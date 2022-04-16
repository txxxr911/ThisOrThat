//
//  NetRequests.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

protocol RequstModelSerealizable {
    func parameters() -> [String: Any]
    func body() -> Data
}

extension RequstModelSerealizable {
    func parameters() -> [String: Any] { return [:] }
    func body() -> Data { return Data() }
}
