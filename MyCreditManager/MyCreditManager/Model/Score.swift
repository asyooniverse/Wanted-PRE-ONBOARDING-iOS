//
//  score.swift
//  MyCreditManager
//
//  Created by 지윤 on 2023/04/26.
//

import Foundation

struct Score {
    var subjectName: String
    var subjectScore: Double
    var scoreTitle: String

    init(subjectName: String, subjectScore: Double, scoreTitle: String) {
        self.subjectName = subjectName
        self.subjectScore = subjectScore
        self.scoreTitle = scoreTitle
    }
    
}
