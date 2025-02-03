//
//  DonutsResponse.swift
//  Donuts
//
//  Created by Diggo Silva on 30/01/25.
//

import Foundation

struct DonutsResponse: Codable {
    let products: [Product]
}

struct Product: Codable {
    let id: Int
    let name: String
    let category: Category
    let description: String
    let imageURL: String
    let price: Double
    let protein, calories, carb: Int
}

struct Category: Codable {
    let name: Name
    let imageURL: String
}

enum Name: String, Codable {
    case coldDrinks = "Cold Drinks"
    case donuts = "Donuts"
    case hotDrinks = "Hot Drinks"
    case sandwiches = "Sandwiches"
}
