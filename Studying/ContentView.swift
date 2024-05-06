//
//  ContentView.swift
//  Studying
//
//  Created by 张炫阳 on 2024/5/6.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["🥰","😜","🤪","🥳","🤩"]
    var body: some View {
        VStack(spacing: 10,content: {
            ForEach(emojis.indices,id:\.self){index in
                CardView(content: emojis[index])
            }
        })
        .padding()
    }
}

struct CardView: View {
    
    var content:String
    @State var faceUp:Bool = false
    
    
    var body: some View {
        ZStack{
            if faceUp{
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(style: StrokeStyle(lineWidth: 10,dash: [10,2]))
                    .foregroundColor(.orange)
                Text(content)
                    .font(Font.system(size: 40))
            }else{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.orange)
            }
        }
        .onTapGesture(count: 1, perform: {
            print("tapped")
            faceUp.toggle()
            
        })
    }
}

struct ContentView_Preview:PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
struct CardView_Preview:PreviewProvider{
    static var previews: some View{
        CardView(content: "🥲")
    }
}
