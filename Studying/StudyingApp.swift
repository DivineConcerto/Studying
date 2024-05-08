//
//  StudyingApp.swift
//  Studying
//
//  Created by 张炫阳 on 2024/5/6.
//

import SwiftUI

@main
struct StudyingApp: App {
    
    @StateObject var viewModel = EmojisMemorizeGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
