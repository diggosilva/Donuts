//
//  MainScreenViewController.swift
//  Donuts
//
//  Created by Diggo Silva on 29/01/25.
//

import UIKit
import SDWebImage

class MainScreenViewController: UIViewController {
    
    // MARK: - Properties
    
    let mainScreenView = MainScreenView()
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        view = mainScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimationLogo()
        setDelegatesAndDataSources()
    }
    
    // MARK: - Setup Methods
    
    private func setDelegatesAndDataSources() {
        mainScreenView.delegate = self
    }
}

// MARK: - MainScreenViewDelegate Methods

extension MainScreenViewController: MainScreenViewDelegate {
    
    func logoTapped() {
        mainScreenView.timer?.invalidate()
        let feedVC = FeedViewController()
        navigationController?.pushViewController(feedVC, animated: true)
    }
    
    func startAnimationLogo() {
        mainScreenView.timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            self.animateLogo(duration: 0.1, rotateAngle: 0.05)
        })
    }
    
    func animateLogo(duration: CGFloat, rotateAngle: CGFloat) {
        UIView.animate(withDuration: duration, animations: {
            self.mainScreenView.logo.transform = self.mainScreenView.logo.transform.rotated(by: rotateAngle)
        }) { _ in
            UIView.animate(withDuration: duration, animations: {
                self.mainScreenView.logo.transform = self.mainScreenView.logo.transform.rotated(by: -rotateAngle * 2)
            }) { _ in
                UIView.animate(withDuration: duration, animations: {
                    self.mainScreenView.logo.transform = self.mainScreenView.logo.transform.rotated(by: rotateAngle)
                })
            }
        }
    }
}
