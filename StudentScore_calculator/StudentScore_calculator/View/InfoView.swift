//
//  InfoView.swift
//  StudentScore_calculator
//
//  Created by 서준영 on 1/19/25.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            InfoText()
        }
    }
}

struct InfoText: View {
    var body: some View {
        Text("""
        - 등급 계산법

        상위 누적비율
        1등급 : 0 ~ 4%
        2등급 : 4 ~ 11%
        3등급 : 11 ~ 23%
        4등급 : 23 ~ 40%
        5등급 : 40 ~ 60%
        6등급 : 60 ~ 77%
        7등급 : 77 ~ 89%
        8등급 : 89 ~ 96%
        9등급 : 96 ~ 100%


        - 순위 계산법

        점수가 동일한 학생은 같은 등수로 처리


        - 비율 계산법

        (학생 순위) / (전체 학생 수)
        *소숫점 3자리에서 반올림
        """)
    }
}

#Preview {
    InfoView()
}
