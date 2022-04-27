//
//  AppState.swift
//  WordBookApp
//
//  Created by 西澤駿 on 2021/10/04.
//

import Foundation
import SwiftUI

class AppState: ObservableObject{
    @Published var selectedTab: Int = 0
}
