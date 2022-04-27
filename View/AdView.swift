//
//  AdView.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/11/02.
//

import SwiftUI
import UIKit
import GoogleMobileAds

struct AdView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
            let view = GADBannerView(adSize: GADAdSizeBanner)
            let viewController = UIViewController()
            //#if DEBUG
            view.adUnitID = "ca-app-pub-3940256099942544/2934735716"

//            #else
//            view.adUnitID = "(本番用広告ユニットID)"
            //#endif
            view.rootViewController = viewController
            viewController.view.addSubview(view)
            viewController.view.frame = CGRect(origin: .zero, size: GADAdSizeBanner.size)
            view.load(GADRequest())
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

