//
//  ContentView.swift
//  Studying
//
//  Created by 张炫阳 on 2024/5/6.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10,content: {
            CardView(faceUp: true)
            CardView(faceUp: true)
            CardView()
            CardView()
        })
        .padding()
    }
}

#Preview {
    ContentView()
}
