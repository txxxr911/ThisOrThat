//
//  Task.swift
//  ThisOrThat
//
//  Created by Victor on 03.05.2022.
//

import Foundation
import RealmSwift

class QuestionRealm: Object {
    override init() {
        super.init()
    }
    
    init(question: Question) {
        super.init()
        
        id = question.id ?? UUID().uuidString
        setName = question.setName
        ruFirst = question.ruFirst
        ruSecond = question.ruSecond
        enFirst = question.enFirst
        enSecond = question.enSecond
    }
    
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var setName = ""
    @objc dynamic var isPlayerd = false
    @objc dynamic var ruFirst: String = ""
    @objc dynamic var ruSecond: String = ""
    @objc dynamic var enFirst: String = ""
    @objc dynamic var enSecond: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class Question: Codable, Equatable {
    static func == (lhs: Question, rhs: Question) -> Bool {
        lhs.id == rhs.id
    }
    init() {
        
    }
    init(realmObject: QuestionRealm) {
        id = realmObject.id
        setName = realmObject.setName
        ruFirst = realmObject.ruFirst
        ruSecond = realmObject.ruSecond
        enFirst = realmObject.enFirst
        enSecond = realmObject.enSecond
    }
    
    var id: String? = UUID().uuidString
    var setName: String = ""

    var ruFirst: String = ""
    var ruSecond: String = ""
    var enFirst: String = ""
    var enSecond: String = ""
}

class QuestionModel {
    let question: Question
    
    init(question: Question) {
        self.question = question
    }
}
