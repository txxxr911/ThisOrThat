//
//  Task.swift
//  ThisOrThat
//
//  Created by Victor on 03.05.2022.
//

import Foundation
import RealmSwift

class TaskRealm: Object {
    override init() {
        super.init()
    }
    
    init(task: Task) {
        super.init()
        
        id = task.id ?? UUID().uuidString
        setId = task.setId
        question = task.question
    }
    
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var setId = ""
    @objc dynamic var isPlayerd = false
    @objc dynamic var question = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class Task: Codable, Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        lhs.id == rhs.id
    }
    init() {
        
    }
    init(realmObject: TaskRealm) {
        id = realmObject.id
        setId = realmObject.setId
        question = realmObject.question
    }
    
    var id: String? = UUID().uuidString
    var setId: String = ""
    var question: String = ""
}

class TaskModel {
    let task: Task
    let score: Int
    
    init(task:Task, score:Int) {
        self.task = task
        self.score = score
    }
}
