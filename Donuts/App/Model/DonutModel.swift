//
//  DonutModel.swift
//  Donuts
//
//  Created by Diggo Silva on 30/01/25.
//

import Foundation

class DonutModel: Codable, CustomStringConvertible {
    let id: Int
    let name: String
    let category: Category
    let donutDescription: String
    let imageURL: String
    let price: Double
    let protein, calories, carb: Int
    
    init(id: Int, name: String, category: Category, donutDescription: String, imageURL: String, price: Double, protein: Int, calories: Int, carb: Int) {
        self.id = id
        self.name = name
        self.category = category
        self.donutDescription = donutDescription
        self.imageURL = imageURL
        self.price = price
        self.protein = protein
        self.calories = calories
        self.carb = carb
    }
    
    var description: String {
        return "DonutModel(id: \(id), name: \(name), category: \(category), donutDescription: \(donutDescription), imageURL: \(imageURL), price: \(price), protein: \(protein), calories: \(calories), carb: \(carb)"
    }
}
