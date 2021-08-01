//
//  SetModel.swift
//  Set
//
//  Created by Michael on 7/31/21.
//

import Foundation

enum cardColor: String,CaseIterable {
    case blue
    case yellow
    case red
}
enum cardShape: String, CaseIterable {
    case diamond = "Diamond"
    case squiggle = "Squiggle"
    case oval = "Oval"
}
enum cardShading: CaseIterable {
    case solid
    case seethrough
    case empty
}
enum cardSymbolQuantity:Int, CaseIterable {
    case one = 1
    case two = 2
    case three = 3
}


struct SetModel {
    var cards: Array<Card> = []
    var score = 0
    var cardsSelected: Array<Card> = []
    var cardsInPlay: Array<Card> = []
    
    init() {
        var current_id = 0
        for eachShading in cardShading.allCases{
            for eachShape in cardShape.allCases{
                for eachColor in cardColor.allCases{
                    for eachQuantity in cardSymbolQuantity.allCases{
                        self.cards.append(Card(id: current_id, count: eachQuantity, color: eachColor, shape: eachShape, shading: eachShading))
                        current_id += 1
                    }
                }
            }
        }
//        cardsInPlay.append(cards[67])
        shuffle()
        cardsInPlay.append(contentsOf: cards[0...11])
        
    }
    
    
    struct Card: Identifiable, Equatable {
        let id: Int
        let count:cardSymbolQuantity
        let color: cardColor
        let shape: cardShape
        let shading: cardShading
        var selected: Bool = false
    }
    
    mutating func choose(card: Card) {
        let x = cards.findIndex(of: card)!
        cards[x].selected.toggle()
        print(cards[x])
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
}


 
