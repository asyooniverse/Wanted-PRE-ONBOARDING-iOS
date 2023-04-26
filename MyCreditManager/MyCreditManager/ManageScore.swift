//
//  ManageScore.swift
//  MyCreditManager
//
//  Created by 지윤 on 2023/04/26.
//

import Foundation

class ManageScore {
    
    var score = 0.0
    var sum = 0.0
    
    func addScore() {
        print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F등)을 띄어쓰기로 구분하여 차례대로 작성해 주세요.")
        print("입력 예시) Mickey Swift A+")
        print("만약 학생의 성적 중 해당 과목이 존재한다면 기존 점수가 갱신됩니다.")
        
        let input = readLine()!
        
        let inputInfo = input.split { $0 == " "}
        
        if inputInfo.count != 3 {
            print("입력이 잘못 되었습니다. 다시 확인해 주세요.\n")
            return
        }
        
        switch inputInfo[2] {
        case "A+": score = 4.5
        case "A": score = 4.0
        case "B+": score = 3.5
        case "B": score = 3.0
        case "C+": score = 2.5
        case "C": score = 2.0
        case "D": score = 1.5
        case "D+": score = 1.0
        case "F": score = 0
        default: print("성적 입력이 잘못 되었습니다. 다시 확인해 주세요.\n")
            return
        }
        
        if let studentIndex = StudentLists.studentLists.firstIndex(where: { $0.studentName == String(inputInfo[0])}) {
            
            if let subjectIndex = StudentLists.studentLists[studentIndex].studentScore.firstIndex(where: { $0.subjectName == String(inputInfo[1])}) {
                StudentLists.studentLists[studentIndex].studentScore[subjectIndex].subjectScore = score
                print("\(String(inputInfo[0])) 학생의 \(String(inputInfo[1])) 과목 성적이 \(String(inputInfo[2]))로 추가(변경)되었습니다.\n")
                return
                
            } else {
                StudentLists.studentLists[studentIndex].studentScore.append(Score(subjectName: String(inputInfo[1]), subjectScore: score, scoreTitle: String(inputInfo[2])))
                print("\(String(inputInfo[0])) 학생의 \(String(inputInfo[1])) 과목 성적이 \(String(inputInfo[2]))로 추가(변경)되었습니다.\n")
                return
            }
            
        } else {
            print("\(inputInfo[0]) 학생을 찾지 못했습니다.\n")
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
        
        if let studentIndex = StudentLists.studentLists.firstIndex(where: { $0.studentName == String(inputInfo[0])}) {
            
            if let subjectIndex = StudentLists.studentLists[studentIndex].studentScore.firstIndex(where: { $0.subjectName == String(inputInfo[1])}) {
                StudentLists.studentLists[studentIndex].studentScore.remove(at: subjectIndex)
                print("\(String(inputInfo[0])) 학생의 \(String(inputInfo[1])) 과목 성적이 삭제되었습니다.\n")
                return
                
            } else {
                print("\(inputInfo[0]) 학생은 해당 과목의 성적이 없습니다.\n")
                return
            }
            
        } else {
            print("\(inputInfo[0]) 학생을 찾지 못했습니다.\n")
            return
        }
    }
    
    func checkAverage() {
        print("평점을 알고 싶은 학생의 이름을 입력해 주세요.")
        
        let input = readLine()!
        var scoreCount = 0
        if input.count != 1 {
            print("입력이 잘못 되었습니다. 다시 확인해 주세요.\n")
            return
        }

        if let studentIndex = StudentLists.studentLists.firstIndex(where: { $0.studentName == input}) {
            scoreCount = StudentLists.studentLists[studentIndex].studentScore.count
            
            if (scoreCount != 0) {
                let scores = StudentLists.studentLists[studentIndex].studentScore.map { "\($0.subjectName): \($0.scoreTitle)" }
                scores.forEach { score in
                    print(score)
                }
                
                for x in StudentLists.studentLists[studentIndex].studentScore {
                    sum += x.subjectScore
                }
                
                print(String(format: "%.2f\n", sum/Double(scores.count)))
                return
                
            } else {
                print("\(input) 학생은 과목별 성적이 없습니다.\n")
                return
            }
            
        } else {
            print("\(input) 학생을 찾지 못했습니다.\n")
            return
        }
    }
}

