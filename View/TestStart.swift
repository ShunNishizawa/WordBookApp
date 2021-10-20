//
//  TestStart.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/28.
//

import SwiftUI
import Lottie

struct TestStart: View {
    @State var numberOfQuestions: Int
    @State private var count = 8 // カウントダウンする秒数
    @State private var isCountDown = true // true:カウントダウン中　false:カウントダウン終了
    @State var show = true
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .center) {
                if (show) {
                    AnimatedView(show: $show, lottieFileName: "CountDown321")
                        .frame(width: 120, height: 120)
                } else {
                    TestView(numberOfQuestions: numberOfQuestions)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

