//
//  FeedCategoryCell.swift
//  Donuts
//
//  Created by Diggo Silva on 31/01/25.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    static let identifier: String = "FeedCellCategory"
    
    lazy var categoryImage: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(systemName: "dog.fill")
        imgView.isUserInteractionEnabled = true
        imgView.contentMode = .scaleAspectFit
        imgView.layer.borderWidth = 1
        imgView.layer.cornerRadius = 15
        return imgView
    }()
    
    lazy var categoryLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Doguinho"
        lbl.font = .systemFont(ofSize: 10)
        lbl.textAlignment = .center
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func configure(model: DonutModel) {
        
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        addSubviews([categoryImage, categoryLabel])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            categoryImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            categoryImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryImage.widthAnchor.constraint(equalToConstant: 50),
            categoryImage.heightAnchor.constraint(equalTo: categoryImage.widthAnchor),
            
            categoryLabel.topAnchor.constraint(equalTo: categoryImage.bottomAnchor, constant: 10),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}
