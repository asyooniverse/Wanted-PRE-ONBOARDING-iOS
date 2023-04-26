//
//  main.swift
//  MyCreditManager
//
//  Created by 지윤 on 2023/04/26.
//

import Foundation

var manageStudent = ManagaStudent()
var manageScore = ManageScore()

while true {
    print("원하는 기능을 입력해 주세요.")
    print("1: 학생 추가, 2: 학생 삭제, 3: 성적 추가(변경), 4: 성적 삭제, 5: 평점 보기, X: 종료")
    
    let input = readLine()

    switch input {
    case "1":
        manageStudent.addStudent()
        
    case "2":
        manageStudent.deleteStudent()
        
    case "3":
        manageScore.addScore()
        
    case "4":
        manageScore.deleteScore()
        
    case "5":
        manageScore.checkAverage()
        
    case "X":
        print("프로그램을 종료합니다 ...")
        exit(0)
        
    default:
        print("뭔가 입력이 잘못 되었습니다. 1~5 사이의 숫자 혹은 X를 입력해 주세요.\n")
    }
}

