//
//  ShapeMaker.swift
//  Set
//
//  Created by Michael on 7/31/21.
//

import SwiftUI

struct ShapeMaker: Shape {
    let percentLeft: Float
    let shape: String
    func path(in rect: CGRect) -> Path {
        
        switch shape {
        case "Diamond":
            var p = Path()
            let scaleFactor:CGFloat = 0.8
            let diamondRatio:CGFloat = 0.2
            p.move(to: CGPoint(x: rect.maxX * scaleFactor , y: rect.midY))
            p.addLine(to: CGPoint(x: rect.midX, y: rect.midY+rect.maxX * diamondRatio))
            p.addLine(to: CGPoint(x: rect.maxX * (1-scaleFactor) , y: rect.midY))
            p.addLine(to: CGPoint(x: rect.midX, y: rect.midY-rect.maxX * diamondRatio))
            return p
            
        case "Squiggle":
            var path = Path()
            
            path.move(to: CGPoint(x: 104.0, y: 15.0))
            path.addCurve(to: CGPoint(x: 63.0, y: 54.0),
                          control1: CGPoint(x: 112.4, y: 36.9),
                          control2: CGPoint(x: 89.7, y: 60.8))
            path.addCurve(to: CGPoint(x: 27.0, y: 53.0),
                          control1: CGPoint(x: 52.3, y: 51.3),
                          control2: CGPoint(x: 42.2, y: 42.0))
            path.addCurve(to: CGPoint(x: 5.0, y: 40.0),
                          control1: CGPoint(x: 9.6, y: 65.6),
                          control2: CGPoint(x: 5.4, y: 58.3))
            path.addCurve(to: CGPoint(x: 36.0, y: 12.0),
                          control1: CGPoint(x: 4.6, y: 22.0),
                          control2: CGPoint(x: 19.1, y: 9.7))
            path.addCurve(to: CGPoint(x: 89.0, y: 14.0),
                          control1: CGPoint(x: 59.2, y: 15.2),
                          control2: CGPoint(x: 61.9, y: 31.5))
            path.addCurve(to: CGPoint(x: 104.0, y: 15.0),
                          control1: CGPoint(x: 95.3, y: 10.0),
                          control2: CGPoint(x: 100.9, y: 6.9))
            
            let pathRect = path.boundingRect
            path = path.offsetBy(dx: rect.minX - pathRect.minX, dy: rect.minY - pathRect.minY)
            let myScaleFactor:CGFloat = 0.63
            let scale: CGFloat = rect.width / pathRect.width * myScaleFactor
            //                    print(scale)
            let transform = CGAffineTransform(scaleX: scale, y: scale)
            path = path.applying(transform)
            
            
            return path
                .offsetBy(dx: rect.minX  - path.boundingRect.minX + rect.maxX * ( 1 - myScaleFactor )/2 , dy: rect.midY - path.boundingRect.midY)
            
            
            
            
        case "Oval":
            let widthScale:CGFloat = 0.6
            let xOffset:CGFloat = (1 - widthScale)/2
            let heightScale:CGFloat = 0.3 //(1-widthScale)/2
            let heightOffset:CGFloat = heightScale/2
            let p = Path(
                roundedRect: CGRect(
                    x: rect.width * xOffset,
                    y: rect.midY - (rect.width * heightOffset),
                    width: rect.width * widthScale,
                    height: rect.width * heightScale),
                cornerSize: CGSize(
                    width: rect.width * heightOffset ,
                    height:rect.width * heightOffset))
            return p
        default:
            return Circle().path(in: rect)
        }
        
    }
    
    
}

struct ShapeMakerPreview: PreviewProvider {
    static var previews: some View{
        ShapeMaker(percentLeft: 20, shape: "Squiggle")
        //        ShapeMaker(percentLeft: 20, shape: "Diamond")
        
    }
}
