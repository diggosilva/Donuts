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
    let rating: Double
    let available: Bool
}

enum Category: String, Codable {
    case coldDrinks = "cold_drinks"
    case donuts = "donuts"
    case hotDrinks = "hot_drinks"
    case sandwiches = "sandwiches"
}
