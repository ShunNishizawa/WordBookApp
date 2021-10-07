//
//  TestView.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/09/23.
//

import SwiftUI
import Lottie

struct TestSettingView: View {
    @State var numberOfQuestions:Int //質問数
    @State var numberOfRecordedWords:Int //登録単語数
    @State var checkFlg: Bool = false //出題数チェックフラグ
    @State private var toTestView = false //TestViewへの切り替えフラグ
    @State private var showAlert = false //アラート出力フラグ
    
    var body: some View {
        NavigationView{
            VStack{
                Group{
                    if checkNumbersOfRecordWords(numbersOfRecordWords: numberOfRecordedWords){
                        HStack{
                            Text("登録単語数")
                            Text("\(numberOfRecordedWords)")
                        }
                    }else{
                        Text("単語が1つも登録されていません。")
                            .foregroundColor(.red)
                            .font(.headline)
                    }
                }
                .frame(width: 300, height: 30)
                
                HStack{
                    Text("出題数")
                    TextField("出題数入力", value: $numberOfQuestions, formatter: NumberFormatter())
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .onChange(of: numberOfQuestions, perform: { questions in
                            numberOfQuestions = questions
                        })
                }
                
                Button(action:{
                    if checknumberOfQuestions(numberOfQuestions: self.numberOfQuestions, numberOfRecordWords: self.numberOfRecordedWords){
                        self.showAlert = true
                        checkFlg = true
                    }else{
                        checkFlg = false
                    }
                }){
                    LottieView(name: "33002-start-button", loopMode: .playOnce)
                        .frame(width: 250, height: 250)
                }
                
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(""), message: Text("テストを開始しますか?"), primaryButton: .default(Text("はい"), action: {
                        self.toTestView = true
                    }), secondaryButton: .default(Text("いいえ")))
                }
                
                NavigationLink(destination: TestStart(numberOfQuestions: numberOfQuestions), isActive: $toTestView){
                    EmptyView()
                }
                
                //テスト開始か否かを判定
                if checkFlg == true{
                    Text("")
                }else{
                    Text("出題数が0または登録単語数を超えています。")
                        .foregroundColor(.red)
                }
            }
            
            Color.black
                .opacity(0.4)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    UIApplication.shared.closeKeyboardTest()
                }
        } .navigationBarBackButtonHidden(true)
    }
}

/// 登録単語数チェック処理
/// - Parameter numbersOfRecordWords: 登録単語数
/// - Returns: Bool
func checkNumbersOfRecordWords(numbersOfRecordWords: Int) -> Bool{
    //単語登録がされているか
    if numbersOfRecordWords != 0{
        return true
    }else{
        return false
    }
}

/// 出題数チェック処理
/// - Parameters:
///   - numberOfQuestions: 入力された出題数
///   - numberOfRecordWords: 登録単語数
/// - Returns: Bool
func checknumberOfQuestions(numberOfQuestions: Int, numberOfRecordWords: Int) -> Bool {
    
    //入力された出題数が0ではなくかつ登録単語数を超えていないか
    if (numberOfQuestions != 0 && numberOfQuestions <= numberOfRecordWords){
        return true
    }else{
        return false
    }
}

extension UIApplication {
    func closeKeyboardTest() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct TestSettingView_Previews: PreviewProvider {
    static var previews: some View {
        TestSettingView(numberOfQuestions: 3, numberOfRecordedWords: 4)
    }
}
