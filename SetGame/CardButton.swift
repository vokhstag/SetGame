//
//  CardButton.swift
//  SetGame
//
//  Created by Vokh Stag on 12/10/2019.
//  Copyright © 2019 Vokh Stag. All rights reserved.
//

import UIKit

class CardButton: UIButton {
    
    let shape = ["●", "▲", "■"]
    let color: [UIColor] = [#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)]
    let fill: [CGFloat] = [0.0, 0.15, 1]
    
    func drawCardButton (shapeIndex: Int, colorIndex: Int, count: Int, fillIndex: Int) {
        let title = createString(shape: shape[shapeIndex], color: color[colorIndex], count: count, fillValue: fill[fillIndex], fill: {(fill[fillIndex] == 0.0) ? 5.0 : -8.0})
        setAttributedTitle(title, for: .normal)
        
        layer.cornerRadius = 5.0
        layer.borderWidth = 3.0
        layer.borderColor = backgroundColor?.cgColor
    }
    
    func selectedCardBorder () {
        layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }
    func matchedCardBorder () {
        layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    }
    func dismatchCardBodred () {
        layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    private func createString(shape: String, color: UIColor, count: Int, fillValue: CGFloat, fill: () -> CGFloat) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: color.withAlphaComponent(fillValue), .strokeWidth: fill(), .strokeColor: color, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        var str = "\n"
        for _ in 1...count {
            str += shape + "\n"
        }
        return NSAttributedString(string: str, attributes: attributes)
    }

}
