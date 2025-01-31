//
//  FeedViewController.swift
//  Donuts
//
//  Created by Diggo Silva on 31/01/25.
//

import UIKit

class FeedViewController: UIViewController {
    
    let feedView = FeedView()
    
    override func loadView() {
        super.loadView()
        view = feedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        view.backgroundColor = .cyan
    }
    
    private func setNavBar() {
        title = "🍩 Donuts"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesBackButton = true
    }
}

class FeedView: UIView {
    
}
