//
//  ResultView.swift
//  StudentScore_calculator
//
//  Created by 서준영 on 1/19/25.
//

import SwiftUI

struct ResultView: View {
    @Binding var students: [(name: String, score: String)]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 0) {
                    RIndex()
                    RScroll(students: $students)
                    Buttons()
                    Spacer()
                }
            }
        }
        .navigationTitle("결과")
    }
}

struct RIndex: View {
    var body: some View {
        HStack(spacing: 35) {
            Text("순위")
                .font(.system(size: 22, weight: .bold))
            Text("이름")
                .font(.system(size: 22, weight: .bold))
            Text("점수")
                .font(.system(size: 22, weight: .bold))
            Text("등급")
                .font(.system(size: 22, weight: .bold))
            Text("비율")
                .font(.system(size: 22, weight: .bold))
        }
        .padding(.top, 20)
        .padding(.bottom, 10)
    }
}

struct RScroll: View {
    @Binding var students: [(name: String, score: String)]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(0..<students.count, id: \.self) { index in
                    RStudent(rank: 1, name: students[index].name, score: students[index].score, grade: 1, percent: 0.01)
                }
            }
        }
    }
}

struct RStudent: View {
    @State var rank: Int
    @State var name: String
    @State var score: Any
    @State var grade: Int
    @State var percent: Double
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                Text("\(rank)")
                    .font(.system(size: 15))
                    .padding(.leading, 53)
                Spacer()
            }
            HStack(spacing: 0) {
                Text("\(name)")
                    .font(.system(size: 15))
                    .padding(.leading, 112)
                Spacer()
            }
            
            Text("\(score)")
                .font(.system(size: 15))
            
            HStack(spacing: 0) {
                Text("\(grade)")
                    .font(.system(size: 15))
                    .padding(.leading, 271)
                Spacer()
            }
            HStack(spacing: 0) {
                Text(String(format: "%.2f", percent))
                    .font(.system(size: 15))
                    .padding(.leading, 335)
                Spacer()
            }
        }
        .padding(.vertical, 5)
    }
}

struct Buttons: View {
    @State private var showAlert = false
    
    var body: some View {
        HStack(spacing: 30) {
            Button(action: {
                showAlert = true
            }) {
                ZStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 145, height: 88)
                        .cornerRadius(5)
                    Text("결과\n복사")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(Color.white)
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("알림"), message: Text("클립보드에 복사되었습니다"), dismissButton: .default(Text("확인")))
            }
            
            Button(action: {
                //TODO: 초기화 기능
            }) {
                ZStack {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 145, height: 88)
                        .cornerRadius(5)
                    Text("초기화")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(Color.white)
                }
            }
        }
    }
}


//#Preview {
//    ResultView()
//}
