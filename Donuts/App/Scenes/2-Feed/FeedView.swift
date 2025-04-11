//
//  FeedView.swift
//  Donuts
//
//  Created by Diggo Silva on 31/01/25.
//

import UIKit

class FeedView: UIView {
    
    // MARK: - UI Elements
    
    lazy var collectionCategory: UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        let screenWidth = (UIScreen.main.bounds.width - 50) / 4
        layout.itemSize = CGSize(width: screenWidth, height: 80)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    lazy var collectionDonut: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
        layout.minimumInteritemSpacing = 30
        layout.minimumLineSpacing = 30
        
        let screenWidth = (UIScreen.main.bounds.width - 90) / 2
        layout.itemSize = CGSize(width: screenWidth, height: 200)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(DonutCell.self, forCellWithReuseIdentifier: DonutCell.identifier)
        return cv
    }()
    
    lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        return spinner
    }()
    
    lazy var loadingLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Carregando..."
        lbl.textColor = .secondaryLabel
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 12)
        return lbl
    }()
    
    var onTapAddFavorite: ((DonutModel) -> Void)?
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Actions
    
    @objc func imgTapped(sender: UITapGestureRecognizer) {
        guard let imgView = sender.view as? UIImageView else { return }
        print("Tocou na imagem com tag: \(imgView.tag)")
    }
    
    // MARK: - Setup Methods
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        backgroundColor = .systemBackground
        addSubviews([collectionCategory, collectionDonut, spinner, loadingLabel])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionCategory.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionCategory.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionCategory.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionCategory.heightAnchor.constraint(equalToConstant: 150),
            
            collectionDonut.topAnchor.constraint(equalTo: collectionCategory.bottomAnchor, constant: 10),
            collectionDonut.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionDonut.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionDonut.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            loadingLabel.centerXAnchor.constraint(equalTo: spinner.centerXAnchor),
            loadingLabel.topAnchor.constraint(equalTo: spinner.bottomAnchor),
            loadingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            loadingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}
