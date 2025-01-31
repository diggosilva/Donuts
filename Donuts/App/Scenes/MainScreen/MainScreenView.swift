//
//  MainScreenView.swift
//  Donuts
//
//  Created by Diggo Silva on 31/01/25.
//

import UIKit
import SDWebImage

protocol MainScreenViewDelegate: AnyObject {
    func logoTapped()
    func startAnimationLogo()
    func animateLogo(duration: CGFloat, rotateAngle: CGFloat)
}

class MainScreenView: UIView {
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
    
    weak var delegate: MainScreenViewDelegate?
    weak var timer: Timer?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    @objc func logoTapped() {
        delegate?.logoTapped()
    }
    
    func startAnimationLogo() {
        delegate?.startAnimationLogo()
    }
    
    func animateLogo(duration: CGFloat, rotateAngle: CGFloat) {
        delegate?.animateLogo(duration: duration, rotateAngle: rotateAngle)
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        backgroundColor = .white
        addSubview(logo)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: centerYAnchor),
            logo.widthAnchor.constraint(equalToConstant: 300),
            logo.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
}
