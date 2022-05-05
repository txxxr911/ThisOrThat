//
//  QuestionDataServiceType.swift
//  ThisOrThat
//
//  Created by Victor on 02.05.2022
//	
//

import Foundation

protocol QuestionDataServiceType: JsonDataService {
    func getFree(setId: String) -> [Task]
    func getAll(setId: String) -> [Task]
    func save(task: Task)
    func importToRealm()
    func resetCard()
}
