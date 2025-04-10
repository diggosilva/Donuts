//
//  TabBarController.swift
//  Donuts
//
//  Created by Diggo Silva on 08/04/25.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        navigationItem.hidesBackButton = true
    }
    
    private func setupTabBar() {
        UITabBar.appearance().isTranslucent = false
        viewControllers = [createFeedNavController(), createFavoritesNavController()]
    }
    
    private func createFeedNavController() -> UINavigationController {
        let feedNacController = UINavigationController(rootViewController: FeedViewController())
        feedNacController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        return feedNacController
    }
    
    private func createFavoritesNavController() -> UINavigationController {
        let favoritesNavController = UINavigationController(rootViewController: FavoritesViewController())
        favoritesNavController.tabBarItem = UITabBarItem(title: "Favoritos", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        return favoritesNavController
    }
}
