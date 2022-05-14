//
//  QuestionDataService.swift
//  ThisOrThat
//
//  Created by Victor on 02.05.2022
//	
//

import Foundation
import RealmSwift

class QuestionDataService: QuestionDataServiceType {

    
    
    let realm = try! Realm()
    
//    func getFree(setName: String) -> [Question] {
//        let all = realm.objects(QuestionRealm.self)
//        if setName == "demo" {
//            return all
//                .filter {!$0.isPlayerd}
//                .prefix(60)
//                .map {Question(realmObject: $0)}
//        }
//        
////        return all
////            .filter { $0.setId == setId }
////            .prefix(Constants.Configs.demoCardsCount)
////            .filter { !$0.isPlayerd }
////            .map { Task(realmObject: $0) }
//    }
    
    func getAll(setName: String) -> [Question] {
        let all = realm.objects(QuestionRealm.self).shuffled()
        if setName == "demo" {
            return all.filter { !$0.isPlayerd }.map { Question(realmObject: $0)}
        }
        return all.filter {$0.setName == setName && !$0.isPlayerd }.map { Question(realmObject: $0)}
    }
    
//    func save(task: Task) {
//        try? realm.write {
//            let realmObject = TaskRealm(task: task)
//            realmObject.isPlayerd = true
//            realm.add(realmObject, update: .all)
//        }
//    }
    
    func importToRealm() {
        let items = getAll().shuffled()
        let realmItems = items.map { QuestionRealm(question: $0) }
        try? realm.write {
            realm.add(realmItems)
        }
    }
    
    func resetCard() {
        let all = realm.objects(QuestionRealm.self)
        try? realm.write {
            all.forEach {$0.isPlayerd = false}
            realm.add(all, update: .all)
        }
    }
    
    private func getAll() -> [Question] {
        let data = readLocalJSONFile(forName: "questions")
        guard let data = data else {
            return []
        }
        return parse(jsonData: data) ?? []
    }
    
}
