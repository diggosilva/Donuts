//
//  FavoritesCell.swift
//  Donuts
//
//  Created by Diggo Silva on 10/04/25.
//

import UIKit

class FavoritesCell: UITableViewCell {
    
    static let identifier = "FavoritesCell"
    
    lazy var donutImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return img
    }()
    
    lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .preferredFont(forTextStyle: .headline)
        return lbl
    }()
    
    lazy var priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .preferredFont(forTextStyle: .subheadline)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func configure(donutModel: DonutModel) {
        guard let url = URL(string: donutModel.imageURL) else { return }
        
        donutImage.sd_setImage(with: url)
        nameLabel.text = donutModel.name
        priceLabel.text = "R$ \(donutModel.price)"
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        addSubviews([donutImage, nameLabel, priceLabel])
    }
    
    private func setConstraints() {
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            donutImage.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            donutImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            donutImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            donutImage.widthAnchor.constraint(equalToConstant: 64),
            donutImage.heightAnchor.constraint(equalTo: donutImage.widthAnchor),
            
            nameLabel.centerYAnchor.constraint(equalTo: donutImage.centerYAnchor, constant: -padding * 1.5),
            nameLabel.leadingAnchor.constraint(equalTo: donutImage.trailingAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            
            priceLabel.centerYAnchor.constraint(equalTo: donutImage.centerYAnchor, constant: padding * 1.5),
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
        ])
    }
}
