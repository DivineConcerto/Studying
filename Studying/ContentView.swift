//
//  ContentView.swift
//  Studying
//
//  Created by 张炫阳 on 2024/5/6.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["🥰","😜","🤪","🥳","🤩","😇","😅"]
    @State var showAmount:Int = 4
    var body: some View {
        VStack{
            cards
            cardsAdjuster
        }
        .padding()
    }
    
    
    func cardCountAdjuster(by offset:Int,symbol:String) -> some View{
        Button(action: {
            showAmount += offset
        }, label: {
            Image(systemName: symbol)
                .imageScale(.large)
                .font(.largeTitle)
        })
        .disabled(showAmount + offset > emojis.count || showAmount + offset < 1)
    }
        
    
    var cardsAdjuster:some View{
        HStack{
            cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
            Spacer()
            cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
        }
        
    }
    
    var cards:some View{
        LazyVGrid(columns: [GridItem(),GridItem()], content: {
            ForEach(0..<showAmount,id:\.self){index in
                CardView(content: emojis[index])
            }
            
        })
       
        .foregroundColor(.orange)
    }
    
    
    
    var addButton:some View{
        Button(action: {
            if showAmount < emojis.count{
                showAmount += 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.plus.fill")
        })
    }
    
    var minusButton:some View{
        Button(action: {
            if showAmount > 1{
                showAmount -= 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.minus.fill")
        })
    }
}

struct CardView: View {
    
    var content:String
    @State var faceUp:Bool = true
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
            Group{
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(style: StrokeStyle(lineWidth: 5,dash: [10,2]))
                Text(content)
                    .font(Font.system(size: 40))
            }
            .opacity(faceUp ? 1 : 0)
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
