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
                    SplashAnimationView(show: $show)
                        .frame(width: 120, height: 120)
                } else {
                    TestView(numberOfQuestions: numberOfQuestions)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct SplashAnimationView: UIViewRepresentable {
    
    @Binding var show: Bool
    
    func makeUIView(context: Context) -> some AnimationView {
        let view = AnimationView(name: "CountDwon321", bundle: Bundle.main)
        // lottie animationを表示開始
        view.play { (status) in
            if status {
                withAnimation(.spring()) {
                    // 表示が終了したタイミングで表示フラグをOFFに
                    show = false
                }
            }
        }
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
