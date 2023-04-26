//
//  ManageScore.swift
//  MyCreditManager
//
//  Created by 지윤 on 2023/04/26.
//

import Foundation

class ManageScore {
    
    var score = 0.0
    
    func addScore() {
        print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F등)을 띄어쓰기로 구분하여 차례대로 작성해 주세요.")
        print("입력 예시) Mickey Swift A+")
        print("만약 학생의 성적 중 해당 과목이 존재한다면 기존 점수가 갱신됩니다.")
        
        let input = readLine()!
        
        let inputInfo = input.split { $0 == " "}
        let name = String(inputInfo[0])
        let subject = String(inputInfo[1])
        var score = Double(inputInfo[2])
        
        // 이름, 과목, 성적 모두 제대로 입력했는지
        if inputInfo.count != 3 {
            print("입력이 잘못 되었습니다. 다시 확인해 주세요.\n")
            return
        }
        
        // 성적 제대로 입력했는지
        switch inputInfo[2] {
        case "A+": score = 4.5
        case "A": score = 4.0
        case "B+": score = 3.5
        case "B": score = 3.0
        case "C+": score = 4.5
        case "C": score = 4.5
        case "D": score = 4.5
        case "D+": score = 4.5
        case "F": score = 4.5
        default: print("성적 입력이 잘못 되었습니다. 다시 확인해 주세요.\n")
            return
        }
        
        // 존재하는 학생인지
        if StudentLists.studentLists.firstIndex(where: { $0.studentName == name } ) != nil {
            return
        } else {
            return
        }
        
    }
    
    func deleteScore() {
        print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례대로 작성해 주세요.")
        print("입력 예시) Mickey Swift")
        
        let input = readLine()!
        
        let inputInfo = input.split { $0 == " "}
        
        if inputInfo.count != 2 {
            print("입력이 잘못 되었습니다. 다시 확인해 주세요.\n")
            return
        }
        
        // 학생이 있으면 삭제
        if let studentIndex = StudentLists.studentLists.firstIndex(where: { $0.studentName == inputInfo[0] } ) {
            StudentLists.studentLists.remove(at: studentIndex)
        } else { // 없으면 리턴
            print("\(inputInfo[0]) 학생을 찾지 못했습니다.\n")
            return
        }
        
    }
}

