//
//  ContentView.swift
//  StudentScore_calculator
//
//  Created by 서준영 on 1/18/25.
//

import SwiftUI

struct ContentView: View {
    // 각 텍스트 필드의 이름과 점수를 담을 배열
    @State private var students: [(name: String, score: String)] = [
        (name: "", score: ""),
        (name: "", score: ""),
        (name: "", score: "")
    ]
    
    var body: some View {
        VStack {
            // 여러 개의 텍스트 필드를 생성하는 ForEach
            ForEach(0..<students.count, id: \.self) { index in
                HStack {
                    TextField("학생 이름", text: $students[index].name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextField("점수", text: $students[index].score)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
            }

            // 학생 추가 버튼
            Button(action: {
                addStudent()
            }) {
                Text("학생 추가")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()

            // 버튼을 눌렀을 때 값 추출
            Button(action: {
                submitScores()
            }) {
                Text("입력 완료")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .padding()
    }
    
    // 학생을 추가하는 함수
    func addStudent() {
        students.append((name: "", score: "")) // 새로운 학생 항목을 배열에 추가
    }
    
    // 입력된 이름과 점수를 추출하는 함수
    func submitScores() {
        for student in students {
            if let score = Int(student.score) {
                print("학생 이름: \(student.name), 점수: \(score)")
            } else {
                print("학생 이름: \(student.name), 잘못된 점수 입력")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
