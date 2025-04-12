//
//  FavoritesViewModel.swift
//  Donuts
//
//  Created by Diggo Silva on 10/04/25.
//

import Foundation

class FavoritesViewModel {
    
    var donuts: [DonutModel] = []
    private let repository: RepositoryProtocol
        
    init(repository: RepositoryProtocol = Repository()) {
        self.repository = repository
        loadDonuts()
    }
    
    func numberOfRowsInSection() -> Int {
        donuts.count
    }
    
    func cellForRow(at indexPath: IndexPath) -> DonutModel {
        return donuts[indexPath.row]
    }
    
    func loadDonuts() {
        donuts = repository.getDonuts()
    }
    
    func saveDonuts() {
        repository.saveDonuts(donuts)
    }
    
    func removeDonut(at index: Int) {
        donuts.remove(at: index)
    }
}
