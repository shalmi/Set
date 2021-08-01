//
//  SetViewModel.swift
//  Set
//
//  Created by Michael on 7/31/21.
//

import SwiftUI

class SetViewModel: ObservableObject {
    private var model: SetModel
    
    init() {
        self.model = SetModel()
    }
    
    // MARK: - Access to the Model
    var cardsInPlay: Array<SetModel.Card> {
        return model.cardsInPlay
    }
    
    func getColor(cardColor: cardColor) -> Color {
        switch cardColor {
        case .blue:
            return Color.blue
        case .red:
            return Color.red
        case .yellow:
            return Color.yellow
        }
    }
    
    func getShading(cardShading: cardShading) -> Double {
        switch cardShading {
        case .empty:
            return 0
        case .seethrough:
            return 0.5
        case .solid:
            return 1
        }
    }
    
    func getShape(shape: cardShape) -> some Shape {
        return ShapeMaker(percentLeft: 75,shape: shape.rawValue)
    }
    
    func printCards() -> String {
        var response = ""
        for card in model.cards {
            response.append(String(card.id)+",")
            print(card)
        }
        return response
    }
    
    func printCardsInPlay() -> String{
        var response = ""
        for card in model.cardsInPlay {
            response.append(String(card.id)+",")
            print(card)
        }
        return response
    }
    
    // MARK: - Intentions
    func chooseCard(card:SetModel.Card) -> Void {
        model.choose(card: card)
//        print(card)
    }
}
