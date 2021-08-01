//
//  SetView.swift
//  Set
//
//  Created by Michael on 7/31/21.
//

import SwiftUI

struct SetView: View {
    
    @ObservedObject var game: SetViewModel
    var body: some View {
        
        AspectVGrid(items: game.cardsInPlay, aspectRatio: 2/3){ eachCard in
            CardView(card:eachCard, colorTranslator: game.getColor(cardColor:), shapeTranslator: game.getShape(shape: ), shadingTranslator: game.getShading(cardShading: ))
                .onTapGesture{game.chooseCard(card: eachCard)}
                .padding(4)
        }.padding()
    }

    
    struct CardView<someShape>: View where someShape: View {

        let card: SetModel.Card
        let colorTranslator: (cardColor) ->Color
        let shapeTranslator: (cardShape) ->someShape
        let shadingTranslator: (cardShading) -> Double
        var body: some View{
            VStack{
                Spacer()
                ForEach(0 ..< card.count.rawValue){ _ in
                    ZStack{
                        shapeTranslator(card.shape).foregroundColor(colorTranslator(card.color))
                        if shadingTranslator(card.shading) != 1 {
                            shapeTranslator(card.shape).foregroundColor(.white).padding(5)
                            shapeTranslator(card.shape).foregroundColor(colorTranslator(card.color)).padding(5).opacity(shadingTranslator(card.shading))
                        }
                    }
                }
                Spacer()
            }.caridify()
        }
    }
    
    
    
    
    
struct SetView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetViewModel()
        SetView(game: game)
    }
}
}
