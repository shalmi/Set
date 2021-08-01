//
//  Cardify.swift
//  Set
//
//  Created by Michael on 7/31/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    func body(content: Content) -> some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: cornerRadius)
            shape.fill().foregroundColor(.white)
            shape.stroke(lineWidth: lineWidth)
            content
        }
        
    }
    
    // MARK: - Constants
    let cornerRadius:CGFloat = 5
    let lineWidth: CGFloat = 3
}

extension View {
func caridify() -> some View {
    self.modifier(Cardify())
    }
}
