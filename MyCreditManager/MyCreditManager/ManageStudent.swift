//
//  manageStudent.swift
//  MyCreditManager
//
//  Created by 지윤 on 2023/04/26.
//

import Foundation

class ManagaStudent {
    
    func addStudent() {
        print("추가할 학생의 이름을 입력해 주세요.")

        let input = readLine()!
        
        if input.trimmingCharacters(in: .whitespaces).count == 0 {
            print("입력이 잘못 되었습니다. 다시 확인해 주세요.\n")
            return
            
        } else if StudentLists.studentLists.contains(where: { $0.studentName == input }) {
            print("\(input) 학생은 이미 존재합니다. 추가하지 않습니다.\n")
            return
            
        } else {
            StudentLists.studentLists.append(Student(studentName: String(input), studentScore: []))
            print("\(input) 학생을 추가했습니다.\n")
            return
        }
        
    }

    func deleteStudent() {
        print("삭제할 학생의 이름을 입력해 주세요.")

        let input = readLine()!

        if let studentIndex = StudentLists.studentLists.firstIndex(where: { $0.studentName == input } ) {
            StudentLists.studentLists.remove(at: studentIndex)
            print("\(input) 학생을 삭제했습니다.\n")
            
        } else {
            print("\(input) 학생을 찾지 못했습니다.\n")
            return
        }
    }
    
}
