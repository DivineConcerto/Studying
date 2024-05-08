//
//  ContentView.swift
//  Studying
//
//  Created by 张炫阳 on 2024/5/6.
//

import SwiftUI

struct ContentView: View {
    
    // ViewModel
    @ObservedObject var viewModel:EmojisMemorizeGame
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Button("Shuffle"){
                viewModel.shuffle()
            }
            
        }
    }

    var cards:some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85),spacing: 0)],spacing: 0, content: {
            ForEach(viewModel.cards.indices,id:\.self){index in
                CardView(card: viewModel.cards[index])
                    .aspectRatio(2/3,contentMode: .fit)
            }.padding(4)
            
        })
       
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    
    var card:MemorizeGame<String>.Card
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
            Group{
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(style: StrokeStyle(lineWidth: 5,dash: [1,1]))
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
        }
    }
}

struct ContentView_Preview:PreviewProvider{
    static var previews: some View{
        ContentView(viewModel: EmojisMemorizeGame())
    }
}
