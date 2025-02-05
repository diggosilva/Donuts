//
//  FeedViewController.swift
//  Donuts
//
//  Created by Diggo Silva on 31/01/25.
//

import UIKit
import SDWebImage

class FeedViewController: UIViewController {
    
    let feedView = FeedView()
    let viewModel = FeedViewModel()
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        view = feedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setDelegatesAndDataSources()
        handleStates()
        viewModel.loadDonuts()
    }
    
    // MARK: - State Handling
    
    private func handleStates() {
        viewModel.state.bind { state in
            switch state {
            case .loading: return self.showLoadingState()
            case .loaded: return self.showLoadedState()
            case .error: return self.showErrorState()
            }
        }
    }
    
    private func showLoadingState() {
        feedView.spinner.startAnimating()
        feedView.loadingLabel.isHidden = false
    }
    
    private func showLoadedState() {
        feedView.spinner.stopAnimating()
        feedView.loadingLabel.isHidden = true
        feedView.collectionCategory.reloadData()
        feedView.collectionDonut.reloadData()
    }
    
    private func showErrorState() {
        let alert = UIAlertController(title: "Ops, algo deu errado!", message: "Tente novamente!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Sim", style: .default) { action in
            self.viewModel.loadDonuts()
        }
        
        let nok = UIAlertAction(title: "Não", style: .cancel) { action in
            self.feedView.spinner.stopAnimating()
            self.feedView.loadingLabel.isHidden = true
        }
        
        alert.addAction(ok)
        alert.addAction(nok)
        present(alert, animated: true)
    }
    
    // MARK: - UI Setup
    
    private func setNavBar() {
        title = "🍩 Donuts"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesBackButton = true
    }
    
    private func setDelegatesAndDataSources() {
        feedView.collectionCategory.delegate = self
        feedView.collectionCategory.dataSource = self
        feedView.collectionDonut.delegate = self
        feedView.collectionDonut.dataSource = self
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == feedView.collectionCategory {
            return viewModel.numberOfImages()
        } else if collectionView == feedView.collectionDonut {
            return viewModel.numberOfItemsInSection()
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == feedView.collectionCategory {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
            cell.configure(model: viewModel.getCategories(at: indexPath))
            return cell
        } else if collectionView == feedView.collectionDonut {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DonutCell.identifier, for: indexPath) as? DonutCell else { return UICollectionViewCell() }
            cell.configure(model: viewModel.getDonut(at: indexPath))
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let selectedItem = viewModel.getDonut(at: indexPath)
        let detailVC = DetailViewController()
        detailVC.title = selectedItem.name
        detailVC.detailView.configure(model: selectedItem)
        
        let navigationcontroller = UINavigationController(rootViewController: detailVC)
        present(navigationcontroller, animated: true)
    }
}
