//
//  Repository.swift
//  Donuts
//
//  Created by Diggo Silva on 10/04/25.
//

import Foundation

protocol RepositoryProtocol {
    func getDonuts() -> [DonutModel]
    func saveDonut(_ donut: DonutModel, completion: @escaping(Result<String, Error>) -> Void)
    func saveDonuts(_ donuts: [DonutModel])
}

class Repository: RepositoryProtocol {
    private let userDefaults = UserDefaults.standard
    private let donutsKey = "donutsKey"
    
    func getDonuts() -> [DonutModel] {
        if let data = userDefaults.data(forKey: donutsKey) {
            if let donutsDecoded = try? JSONDecoder().decode([DonutModel].self, from: data) {
                return donutsDecoded
            }
        }
        return []
    }
    
    func saveDonut(_ donut: DonutModel, completion: @escaping(Result<String, Error>) -> Void) {
        var savedDonuts = getDonuts()
        
        savedDonuts.append(donut)
        
        saveDonuts(savedDonuts)
        completion(.success("Donut saved!"))
        return
    }
    
    func saveDonuts(_ donuts: [DonutModel]) {
        if let donutEncoded = try? JSONEncoder().encode(donuts) {
            userDefaults.set(donutEncoded, forKey: donutsKey)
        }
    }
}
