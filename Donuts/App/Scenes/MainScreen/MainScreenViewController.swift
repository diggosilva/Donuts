//
//  MainScreenViewController.swift
//  Donuts
//
//  Created by Diggo Silva on 29/01/25.
//

import UIKit
import SDWebImage

class MainScreenViewController: UIViewController {
    
    lazy var logo: UIImageView = {
        let url = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXGEYopxlw3ChjyJph_mY85GxPDNUpdkRK_Q&s")
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.sd_setImage(with: url)
        img.contentMode = .scaleAspectFit
        img.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(logoTapped))
        img.addGestureRecognizer(tapGesture)
        return img
    }()
    
    weak var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "DONUTS"
        
        view.addSubview(logo)
        
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logo.widthAnchor.constraint(equalToConstant: 300),
            logo.heightAnchor.constraint(equalToConstant: 300),
        ])
        
        startAnimationLogo()
    }
    
    @objc func logoTapped() {
        guard let timer = timer else { return }
        timer.invalidate()
        print("Vai pra proxima tela")
    }
    
    func startAnimationLogo() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            self.animateLogo(duration: 0.1, rotateAngle: 0.05)
        })
    }
    
    func animateLogo(duration: CGFloat, rotateAngle: CGFloat) {
        UIView.animate(withDuration: duration, animations: {
            self.logo.transform = self.logo.transform.rotated(by: rotateAngle)
        }) { _ in
            UIView.animate(withDuration: duration, animations: {
                self.logo.transform = self.logo.transform.rotated(by: -rotateAngle * 2)
            }) { _ in
                UIView.animate(withDuration: duration, animations: {
                    self.logo.transform = self.logo.transform.rotated(by: rotateAngle)
                })
            }
        }
    }
}
