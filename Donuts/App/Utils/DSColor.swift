//
//  DSColor.swift
//  Donuts
//
//  Created by Diggo Silva on 29/01/25.
//

import UIKit

final class DSColor {
    static let laranja = color(r: 237, g: 115, b: 45, a: 1)
    static let rosa    = color(r: 223, g: 57, b: 142, a: 1)
    
    static func colorsForTypes(type: Int) -> UIColor {
        switch type {
        case 1:  return UIColor.systemYellow
        case 2:  return UIColor.systemOrange
        case 3:  return UIColor.systemBrown
        case 4:  return UIColor.systemPink
        case 5:  return UIColor.systemYellow
        case 6:  return UIColor.systemRed
        case 7:  return UIColor.systemPurple
        case 8:  return UIColor.systemIndigo
        case 9:  return UIColor.magenta
        case 10: return UIColor.systemOrange
        case 11: return UIColor.systemMint
        case 12: return UIColor.brown
        case 13: return UIColor.systemGreen
        case 14: return UIColor.systemTeal
        case 15: return UIColor.orange
        case 16: return UIColor.purple
        case 17: return UIColor.systemCyan
        default:
            return UIColor.systemBlue
        }
    }
}

func color(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
}
