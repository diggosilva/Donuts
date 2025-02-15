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
    let category: DonutCategory
    let donutDescription: String
    let imageURL: String
    let price: Double
    let protein, calories, carb: Int
    var isLiked: Bool = false
    
    init(id: Int, name: String, category: DonutCategory, donutDescription: String, imageURL: String, price: Double, protein: Int, calories: Int, carb: Int) {
        self.id = id
        self.name = name
        self.category = category
        self.donutDescription = donutDescription
        self.imageURL = imageURL
        self.price = price
        self.protein = protein
        self.calories = calories
        self.carb = carb
        self.isLiked = DonutModel.loadLikeState(for: id)
    }
    
    var description: String {
        return "DonutModel(id: \(id), name: \(name), categoryName: \(category.name), categoryImage: \(category.image), donutDescription: \(donutDescription), imageURL: \(imageURL), price: \(price), protein: \(protein), calories: \(calories), carb: \(carb)"
    }
    
    // Salvar o estado do like no UserDefaults
    static func saveLikeState(for id: Int, isLiked: Bool) {
        UserDefaults.standard.set(isLiked, forKey: "likeState_\(id)")
    }
    
    // Carregar o estado do like do UserDefaults
    static func loadLikeState(for id: Int) -> Bool {
        return UserDefaults.standard.bool(forKey: "likeState_\(id)")
    }
}
