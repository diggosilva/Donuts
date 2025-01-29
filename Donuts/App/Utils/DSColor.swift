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
}

func color(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
}
