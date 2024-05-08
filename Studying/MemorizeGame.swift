//
//  MemorizeGame.swift
//  Studying
//
//  Created by 张炫阳 on 2024/5/8.
//

import Foundation

struct MemorizeGame<CardContent>{
    
    private(set) var cards:Array<Card>
    
    init(numberOfPairsOfCards:Int,cardContentFactory:(Int) -> CardContent){
        cards = Array<Card>()
        
        for pairIndex in 0..<max(2,numberOfPairsOfCards){
            let content:CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func chooseCard(card:Card){
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    

    struct Card{
        var isFaceUp:Bool = true
        var isMatched:Bool = false
        var content:CardContent
    }
    
}
