//
//  FeedViewModel.swift
//  Donuts
//
//  Created by Diggo Silva on 31/01/25.
//

import Foundation

enum FeedViewControllerStates {
    case loading
    case loaded
    case error
}

class FeedViewModel {
    
    // MARK: - Properties
    
    var categoriesImage: [DonutCategory] = []
    var donutsList: [DonutModel] = []
    var state: Bindable<FeedViewControllerStates> = Bindable(value: .loading)
    let service: ServiceProtocol = Service()
    
    // MARK: - Categories Data Methods
    
    func numberOfImages() -> Int {
        categoriesImage.count
    }
    
    func getCategories(at indexPath: IndexPath) -> DonutCategory {
        categoriesImage[indexPath.row]
    }
    
    // MARK: - Feed Data Methods
    
    func numberOfItemsInSection() -> Int {
        donutsList.count
    }
    
    func getDonut(at indexPath: IndexPath) -> DonutModel {
        donutsList[indexPath.row]
    }
    
    // MARK: - Network Methods
    
    func loadDonuts() {
        service.getDonuts { [weak self] donuts in
            guard let self = self else { return }
            self.donutsList.append(contentsOf: donuts)
            
            let uniqueCategories = Set(self.donutsList.compactMap({ $0.category }))
            self.categoriesImage = Array(uniqueCategories).sorted { $0.name < $1.name }
            self.state.value = .loaded
        } onError: { [weak self] error in
            guard let self = self else { return }
            self.state.value = .error
        }
    }
}
