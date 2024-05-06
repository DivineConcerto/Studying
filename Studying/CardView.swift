//
//  CardView.swift
//  Studying
//
//  Created by 张炫阳 on 2024/5/6.
//

import SwiftUI

struct CardView: View {
    
    var faceUp:Bool = false
    
    var body: some View {
        ZStack{
            if faceUp{
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(style: StrokeStyle(lineWidth: 10,dash: [10,2]))
                    .foregroundColor(.orange)
                Text("🤪")
                    .font(Font.system(size: 50))
            }else{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.orange)
            }
        }
    }
}


#Preview {
    CardView()
}
