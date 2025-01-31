//
//  Service.swift
//  Donuts
//
//  Created by Diggo Silva on 30/01/25.
//

import Foundation

protocol ServiceProtocol {
    func getDonuts(onSucess: @escaping([DonutModel]) -> Void, onError: @escaping(Error) -> Void)
}

class Service: ServiceProtocol {
    
    func getDonuts(onSucess: @escaping ([DonutModel]) -> Void, onError: @escaping (any Error) -> Void) {
        guard let url = URL(string: ApiEnvironment.api ?? "") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let response = response as? HTTPURLResponse {
                    print("DEBUG: StatusCode: \(response.statusCode)")
                }
                do {
                    let donutsResponse = try JSONDecoder().decode(DonutsResponse.self, from: data ?? Data())
                    var donutsModel: [DonutModel] = []
                    
                    for donutModel in donutsResponse.products {
                        let donut = DonutModel(
                            id: donutModel.id,
                            name: donutModel.name,
                            category: donutModel.category,
                            donutDescription: donutModel.description,
                            imageURL: donutModel.imageURL,
                            price: donutModel.price,
                            protein: donutModel.protein,
                            calories: donutModel.calories,
                            carb: donutModel.carb)
                        
                        donutsModel.append(donut)
                    }
                    onSucess(donutsModel)
                } catch {
                    onError(error)
                    print("DEBUG: Erro ao decodificar Donuts: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
