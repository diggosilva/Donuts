class FeedViewModel {
    let categoriesImage: [String] = [
        "https://dunkin.com.br/wp-content/uploads/2021/07/furado2.png",
        "https://dunkin.com.br/wp-content/uploads/2021/07/CAPPUCCINO-300x300-1.png",
        "https://dunkin.com.br/wp-content/uploads/2021/07/FROZEN-LATTE-300x300-2.png",
        "https://dunkin.com.br/wp-content/uploads/2021/07/saaassas.png"
    ]
    
    var state: Bindable<FeedViewControllerStates> = Bindable(value: .loading)
    var donutsList: [DonutModel] = []
    let service: ServiceProtocol = Service()
    
    func numberOfItemsInSection() -> Int {
        donutsList.count
    }
    
    func getDonut(at indexPath: IndexPath) -> DonutModel {
        donutsList[indexPath.row]
    }
    
    func loadDonuts() {
        service.getDonuts { [weak self] donuts in
            self?.donutsList.append(contentsOf: donuts)
            self?.state.value = .loaded
        } onError: { [weak self] error in
            self?.state.value = .error
        }
    }
}