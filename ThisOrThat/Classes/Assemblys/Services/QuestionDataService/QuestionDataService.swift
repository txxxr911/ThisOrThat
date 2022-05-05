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
    
    func getFree(setId: String) -> [Task] {
        let all = realm.objects(TaskRealm.self)
        if setId == "com.artemtishchenko.thisorthat.all" {
            return all
                .filter { !$0.isPlayerd }
                .prefix(Constants.Configs.demoCardsCount)
                .map {Task(realmObject: $0)}
        }
        
        return all
            .filter { $0.setId == setId }
            .prefix(Constants.Configs.demoCardsCount)
            .filter { !$0.isPlayerd }
            .map { Task(realmObject: $0) }
    }
    
    func getAll(setId: String) -> [Task] {
        let all = realm.objects(TaskRealm.self).shuffled()
        if setId == "com.artemtishchenko.thisorthat.all" {
            return all.filter { !$0.isPlayerd }.map { Task(realmObject: $0)}
        }
        return all.filter {$0.setId == setId && !$0.isPlayerd }.map { Task(realmObject: $0)}
    }
    
    func save(task: Task) {
        try? realm.write {
            let realmObject = TaskRealm(task: task)
            realmObject.isPlayerd = true
            realm.add(realmObject, update: .all)
        }
    }
    
    func importToRealm() {
        let items = getAll().shuffled()
        let realmItems = items.map { TaskRealm(task: $0) }
        try? realm.write {
            realm.add(realmItems)
        }
    }
    
    func resetCard() {
        let all = realm.objects(TaskRealm.self)
        try? realm.write {
            all.forEach {$0.isPlayerd = false}
            realm.add(all, update: .all)
        }
    }
    
    private func getAll() -> [Task] {
        let data = readLocalJSONFile(forName: "tasks")
        guard let data = data else {
            return []
        }
        return parse(jsonData: data) ?? []
    }
    
}
