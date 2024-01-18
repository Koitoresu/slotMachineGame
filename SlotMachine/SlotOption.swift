//
//  SetCard.swift
//  Set
//
//  Created by Koy Torres on 3/6/23.
//

import Foundation

struct SlotOptions: Identifiable {
    
    var shape: Shapes
    var shade: Shades
    var color: Colors
    var isSelected: Bool
    var isMatched: Bool
    var isMisMatched: Bool
    var id: Int
    
    
    
    enum Shapes {
        case arrowUp
        case arrowDown
        case arrowLeft
        case arrowRight
        
        static var all = [Shapes.arrowUp, .arrowDown, .arrowLeft, .arrowRight]
    }
    
    enum Shades {
        case outlined
        case shaded
        case filled
        
        static var all = [Shades.outlined, .shaded, .filled]
    }
    
    enum Colors {
        case red
        case blue
        case green
        case purple
        
        static var all = [Colors.red, .blue, .green, .purple]
    }
    
    func getCardContent() -> String {
        var shape: String
        
        if self.shade == .outlined {
            switch self.shape {
            case .arrowUp:
                shape = "△"
            case .arrowDown:
                shape = "▽"
            case .arrowLeft:
                shape = "◁"
            case .arrowRight:
                shape = "▷"
            }
        } else {
            switch self.shape {
            case .arrowUp:
                shape = "▲"
            case .arrowDown:
                shape = "▼"
            case .arrowLeft:
                shape = "◀"
            case .arrowRight:
                shape = "▶"
            }
        }
        
        var cardEmojis = shape
        
        return cardEmojis
    }
    
    init(shape: Shapes, shade: Shades, color: Colors, count: Int, id: Int) {
        self.shape = shape
        self.shade = shade
        self.color = color
        self.isSelected = false
        self.isMatched = false
        self.isMisMatched = false
        self.id = id
    }
    
}
