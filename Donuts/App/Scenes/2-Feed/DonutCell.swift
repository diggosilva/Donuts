//
//  DonutCell.swift
//  Donuts
//
//  Created by Diggo Silva on 31/01/25.
//

import UIKit

class DonutCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    lazy var bgPrice: UIView = {
        let bg = UIView()
        bg.translatesAutoresizingMaskIntoConstraints = false
        bg.backgroundColor = .systemGreen.withAlphaComponent(0.2)
        bg.layer.cornerRadius = 20
        bg.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner] // Apenas os cantos inferior esquerdo e superior direito
        return bg
    }()
    
    lazy var labelPrice: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 14, weight: .bold)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.8
        return lbl
    }()
    
    lazy var image: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 12, weight: .semibold)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.8
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var companyLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Dunkin's"
        lbl.font = .systemFont(ofSize: 10)
        lbl.textColor = .secondaryLabel
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var likeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "heart")?.withTintColor(.label, renderingMode: .alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(likeTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var addButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Add", for: .normal)
        btn.setTitleColor(.label, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        return btn
    }()
    
    // MARK: - Static Properties
    
    static let identifier: String = "DonutCell"
    var model: DonutModel!
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Actions
    
    @objc func likeTapped() {
        model?.isLiked.toggle()
        
        if let model = model {
            DonutModel.saveLikeState(for: model.id, isLiked: model.isLiked)
        }
        
        if model?.isLiked == true {
            animateLike(duration: 0.1, x: 0.8, y: 0.8)
            likeButton.setImage(UIImage(systemName: "heart.fill")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal), for: .normal)
        } else {
            animateLike(duration: 0.1, x: 0.8, y: 0.8)
            likeButton.setImage(UIImage(systemName: "heart")?.withTintColor(.label, renderingMode: .alwaysOriginal), for: .normal)
        }
    }
    
    func animateLike(duration: CGFloat, x: CGFloat, y: CGFloat) {
        UIView.animate(withDuration: duration, animations: {
            self.likeButton.transform = self.likeButton.transform.scaledBy(x: x, y: y)
        }) { _ in
            UIView.animate(withDuration: duration, animations: {
                self.likeButton.transform = CGAffineTransform.identity
            })
        }
    }
    
    // MARK: - Configuration
    
    func configure(model: DonutModel) {
        guard let url = URL(string: model.imageURL) else { return }
        labelPrice.text = "$\(model.price)"
        image.sd_setImage(with: url)
        nameLabel.text = model.name.capitalized
        self.backgroundColor = DSColor.colorsForTypes(type: model.id).withAlphaComponent(0.1)
        bgPrice.backgroundColor = DSColor.colorsForTypes(type: model.id).withAlphaComponent(0.2)
        labelPrice.textColor = DSColor.colorsForTypes(type: model.id)
        self.layer.cornerRadius = 20
        likeButton.setImage(UIImage(systemName: model.isLiked ? "heart.fill" : "heart"), for: .normal)
        likeButton.tintColor = model.isLiked ? .systemRed : .label
        self.model = model
    }
    
    // MARK: - View Setup
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        addSubviews([bgPrice, labelPrice, image, nameLabel, companyLabel, likeButton, addButton])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            bgPrice.topAnchor.constraint(equalTo: topAnchor),
            bgPrice.trailingAnchor.constraint(equalTo: trailingAnchor),
            bgPrice.widthAnchor.constraint(equalToConstant: 70),
            bgPrice.heightAnchor.constraint(equalToConstant: 35),
            
            labelPrice.centerXAnchor.constraint(equalTo: bgPrice.centerXAnchor),
            labelPrice.centerYAnchor.constraint(equalTo: bgPrice.centerYAnchor),
            labelPrice.leadingAnchor.constraint(equalTo: bgPrice.leadingAnchor, constant: 5),
            labelPrice.trailingAnchor.constraint(equalTo: bgPrice.trailingAnchor, constant: -5),
            
            image.topAnchor.constraint(equalTo: bgPrice.bottomAnchor, constant: 10),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 80),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            companyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            companyLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            companyLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            likeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            likeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            addButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}
