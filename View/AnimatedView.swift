//
//  LottieView.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/28.
//

import Foundation
import Lottie
import SwiftUI

struct AnimatedView: UIViewRepresentable {
    
    @Binding var show: Bool
    @State var lottieFileName: String = ""
    
    func makeUIView(context: Context) -> some AnimationView {
        let view = AnimationView(name: lottieFileName, bundle: Bundle.main)
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

