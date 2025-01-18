//
//  MainView.swift
//  StudentScore_calculator
//
//  Created by 서준영 on 1/18/25.
//

import SwiftUI

struct MainView: View {
    @State var students: [(name: String, score: String)] = [
        (name: "", score: ""),
        (name: "", score: ""),
        (name: "", score: "")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    Title()
                    ListTitle()
                    ScoreInput(students: $students)
                    CalButton(students: $students)
                    Spacer()
                }
            }
        }
    }
}

struct Title: View {
    @State private var isLinkActive = false
    
    var body: some View {
        HStack(spacing: 0) {
            Text("점수 계산기")
                .font(.system(size: 36, weight: .bold))
            Spacer()
            Button(action: {
                // 버튼 클릭 시 화면 전환 트리거
                isLinkActive = true
            }) {
                Image(systemName: "info.circle")
                    .foregroundColor(.black)
                    .font(.system(size: 20))
            }
            .padding(.horizontal, 12)

            NavigationLink(destination: InfoView(), isActive: $isLinkActive) {
                EmptyView()
            }
        }
        .padding(.top, 15)
        .padding(.horizontal, 32)
    }
}

struct ListTitle: View {
    var body: some View {
        HStack {
            Text("이름")
                .font(.system(size: 20, weight: .bold))
                .padding(.leading, 113)
            Spacer()
            Text("점수")
                .font(.system(size: 20, weight: .bold))
                .padding(.trailing, 95)
        }
        .padding(.top, 30)
        .padding(.bottom, 5)
    }
}

struct ScoreInput: View {
    // @Binding을 사용하여 부모에서 전달된 students 배열을 받음
    @Binding var students: [(name: String, score: String)]
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(0..<students.count, id: \.self) { index in
                        StudentInput(students: $students, num: index)
                            .padding(.top, 2)
                            .padding(.bottom, 10)
                    }
                }
            }
            .padding(.top, 5)
            
            Button(action: {
                addStudent()
            }) {
                ZStack {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 333, height: 45)
                        .cornerRadius(5)
                    Text("학생 추가")
                        .font(.system(size: 22))
                        .foregroundStyle(.white)
                }
            }
            .padding(.vertical, 10)
        }
    }
    
    func addStudent() {
        students.append((name: "", score: ""))
    }
}

struct StudentInput: View {
    @Binding var students: [(name: String, score: String)]
    var num: Int
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                Text("\(num + 1)")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.leading, 30)
                
                Spacer()
            }
            
            HStack(spacing: 0) {
                TextField("Name", text: $students[num].name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading, 60)
                    
                TextField("Score", text: $students[num].score)
                    .keyboardType(.numberPad) // 숫자 키보드 사용
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading, 15)
                    .padding(.trailing, 30)
            }
            .padding(.horizontal, 10)
        }
    }
}

struct CalButton: View {
    @State private var isCal: Bool = false
    @Binding var students: [(name: String, score: String)]
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: {
                submitScores()
                isCal = true
            }) {
                ZStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 333, height: 88)
                        .cornerRadius(5)
                    Text("계산")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundStyle(.white)
                }
            }
            
            NavigationLink(destination: ResultView(students: $students), isActive: $isCal) {
                EmptyView()
            }
        }
    }
    
    // 입력된 이름과 점수를 추출하는 함수
    func submitScores() {
        // TODO: ResultView로 데이터 넘겨주어야 함
        for student in students {
            if let score = Int(student.score) {
                print("학생 이름: \(student.name), 점수: \(score), 총 학생수: \(students.count)")
            } else {
                print("학생 이름: \(student.name), 잘못된 점수 입력")
            }
        }
    }
}


#Preview {
    MainView()
}
