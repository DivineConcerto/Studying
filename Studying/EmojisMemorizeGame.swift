//
//  EmojisMemorizeGame.swift
//  Studying
//
//  Created by 张炫阳 on 2024/5/8.
//

import Foundation




func createCardContent(forPairAtIndex index:Int) -> String{
    return ["🥰","😜","🤪","🥳","🤩","😇","😅"][index]
}

class EmojisMemorizeGame{
    
    private static let emojis = ["🥰","😜","🤪","🥳","🤩","😇","😅"]
    
    private static func createMemoryGame() -> MemorizeGame<String>{
        return MemorizeGame(numberOfPairsOfCards: 4){ pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            }else{
                return "😵‍💫"
            }
            
        }
    }
    
    private var model = createMemoryGame()
    
    var cards:Array<MemorizeGame<String>.Card>{
        return model.cards
    }
    
    func choose(_ card:MemorizeGame<String>.Card){
        model.chooseCard(card: card)
    }
}
