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
        let fillOrNot: CGFloat = (fill[fillIndex] == 0.0) ? 5.0 : -8.0
        let title = createString(shape: shape[shapeIndex], color: color[colorIndex], count: count, fillValue: fill[fillIndex], fill: fillOrNot)
        setAttributedTitle(title, for: .normal)
    }
    
    private func createString(shape: String, color: UIColor, count: Int, fillValue: CGFloat, fill: CGFloat) -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: color.withAlphaComponent(fillValue), NSAttributedString.Key.strokeWidth: fill, .strokeColor: color]
        var str = ""
        for _ in 1...count {
            str += shape + "\n"
        }
        return NSAttributedString(string: str, attributes: attributes)
    }

}
