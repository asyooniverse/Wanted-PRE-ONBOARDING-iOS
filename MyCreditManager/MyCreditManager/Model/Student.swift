//
//  Student.swift
//  MyCreditManager
//
//  Created by 지윤 on 2023/04/26.
//

import Foundation

struct StudentLists {
    static var studentLists: [Student] = []
}

struct Student {
    var studentName: String
    var studentScore: [Score]
    
    init(studentName: String, studentScore: [Score]) {
        self.studentName = studentName
        self.studentScore = studentScore
    }
    
}
