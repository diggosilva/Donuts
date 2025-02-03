//
//  DonutCategory.swift
//  Donuts
//
//  Created by Diggo Silva on 31/01/25.
//

import Foundation

class DonutCategory: Codable, CustomStringConvertible, Hashable {
    let name: String
    let image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    var description: String {
        return "DonutCategory: name: \(name), image: \(image)"
    }
    
    // Implement Hashable protocol
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(image)
    }
    
    static func == (lhs: DonutCategory, rhs: DonutCategory) -> Bool {
        return lhs.name == rhs.name && lhs.image == rhs.image
    }
}
