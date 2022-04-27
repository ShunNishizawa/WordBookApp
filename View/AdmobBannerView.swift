//
//  AdmobBannerView.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/11/03.
//

import SwiftUI

struct AdmobBannerView: View {
    var body: some View {
        HStack {
            Spacer()
            AdView().frame(width: 320, height: 50)
            Spacer()
        }
    }
}

struct AdmobBannerView_Previews: PreviewProvider {
    static var previews: some View {
        AdmobBannerView()
    }
}
