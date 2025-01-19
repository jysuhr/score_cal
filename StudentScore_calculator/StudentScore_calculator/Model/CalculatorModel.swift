//
//  CalculatorModel.swift
//  StudentScore_calculator
//
//  Created by 서준영 on 1/19/25.
//

import SwiftUI

struct CalculatorModel {
    @Binding var students: [(name: String, score: String)]
    var resultList: [(rank: Int, name: String, score: String, grade: String, percent: String)] = []

    // 계산 함수
    mutating func calculate() -> [(rank: Int, name: String, score: String, grade: String, percent: String)] {
        // 학생들의 점수를 Double로 변환한 배열 생성
        let scores = students.compactMap { Double($0.score) }
        
        // 점수 합계 계산
        let totalScore = scores.reduce(0, +)
        
        // 평균 계산
        let averageScore = totalScore / Double(scores.count)
        
        // 점수 내림차순으로 정렬
        let sortedScores = scores.sorted(by: >)
        
        // 결과 배열 계산
        resultList = students.enumerated().map { (index, student) in
            // 학생의 점수 확인
            guard let score = Double(student.score) else {
                return (rank: index + 1, name: student.name, score: "0.00", grade: "F", percent: "0.00%")
            }
            
            // 순위 계산
            let rank = sortedScores.firstIndex(of: score)! + 1
            
            // 백분율 계산
            let percent = (Double(rank) / Double(students.count)) * 100
            let formattedPercent = String(format: "%.2f%%", percent)
            
            // 학점 계산
            let grade = String(assignGrade(for: percent).rawValue)
            
            // 결과 반환
            return (rank: rank, name: student.name, score: String(format: "%.2f", score), grade: grade, percent: formattedPercent)
        }
        
        return resultList
    }
    
    // 점수에 따라 학점을 계산하는 함수
    func assignGrade(for percent: Double) -> Grade {
        switch percent {
        case 0..<4:
            return .first
        case 4..<11:
            return .second
        case 11..<23:
            return .third
        case 23..<40:
            return .fourth
        case 40..<60:
            return .fifth
        case 60..<77:
            return .sixth
        case 77..<89:
            return .seventh
        case 89..<96:
            return .eighth
        case 96..<100:
            return .ninth
        default:
            return .NA
        }
    }
}

// 등급 분류 :: rawValue로 출력
enum Grade: Int {
    case first = 1
    case second
    case third
    case fourth
    case fifth
    case sixth
    case seventh
    case eighth
    case ninth
    case NA
}
